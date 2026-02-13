#!/usr/bin/env bash

set -euo pipefail

print_usage() {
  cat <<'EOF'
Usage:
  scripts/deploy_testflight_ios.sh --flavor <dev|stage|prod> --build-name <x.y.z> --build-number <number>

Required environment variables:
  ASC_KEY_ID       App Store Connect API Key ID
  ASC_ISSUER_ID    App Store Connect API Issuer ID
  ASC_API_KEY_PATH Absolute path to .p8 API key file
EOF
}

require_command() {
  local command_name="$1"
  if ! command -v "$command_name" >/dev/null 2>&1; then
    echo "[ERROR] Required command not found: $command_name"
    exit 1
  fi
}

abort_if_dirty_worktree() {
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "[ERROR] Working tree is not clean. Commit or stash changes first."
    exit 1
  fi
}

ensure_required_env() {
  local var_name="$1"
  if [[ -z "${!var_name:-}" ]]; then
    echo "[ERROR] Missing required environment variable: $var_name"
    exit 1
  fi
}

flavor=""
build_name=""
build_number=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --flavor)
      flavor="${2:-}"
      shift 2
      ;;
    --build-name)
      build_name="${2:-}"
      shift 2
      ;;
    --build-number)
      build_number="${2:-}"
      shift 2
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    *)
      echo "[ERROR] Unknown argument: $1"
      print_usage
      exit 1
      ;;
  esac
done

if [[ -z "$flavor" || -z "$build_name" || -z "$build_number" ]]; then
  echo "[ERROR] Missing required arguments."
  print_usage
  exit 1
fi

if [[ ! "$flavor" =~ ^(dev|stage|prod)$ ]]; then
  echo "[ERROR] Invalid flavor: $flavor (must be dev, stage, or prod)"
  exit 1
fi

if [[ ! "$build_number" =~ ^[0-9]+$ ]]; then
  echo "[ERROR] build-number must be a positive integer."
  exit 1
fi

case "$flavor" in
  dev)
    target_file="lib/main_dev.dart"
    ;;
  stage)
    target_file="lib/main_stage.dart"
    ;;
  prod)
    target_file="lib/main_prod.dart"
    ;;
esac

require_command git
require_command fvm
require_command xcrun

ensure_required_env ASC_KEY_ID
ensure_required_env ASC_ISSUER_ID
ensure_required_env ASC_API_KEY_PATH

if [[ ! -f "$ASC_API_KEY_PATH" ]]; then
  echo "[ERROR] ASC_API_KEY_PATH does not exist: $ASC_API_KEY_PATH"
  exit 1
fi

current_branch="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$current_branch" != "development" ]]; then
  echo "[ERROR] This script must be run from development branch. Current: $current_branch"
  exit 1
fi

tmp_key_dir=""
cleanup() {
  set +e

  if git rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1; then
    git merge --abort >/dev/null 2>&1 || true
  fi

  if [[ "$(git rev-parse --abbrev-ref HEAD)" != "development" ]]; then
    git checkout development >/dev/null 2>&1 || true
  fi

  if [[ -n "$tmp_key_dir" && -d "$tmp_key_dir" ]]; then
    rm -rf "$tmp_key_dir"
  fi
}
trap cleanup EXIT

abort_if_dirty_worktree

echo "[INFO] Fetching latest branches..."
git fetch origin

echo "[INFO] Updating development..."
git checkout development
git pull --ff-only origin development

echo "[INFO] Updating main..."
git checkout main
git pull --ff-only origin main

echo "[INFO] Merging development into main..."
git merge --no-ff development -m "Merge development into main for TestFlight release"

echo "[INFO] Pushing main..."
git push origin main

echo "[INFO] Building iOS IPA (flavor=$flavor, build=$build_name+$build_number)..."
rm -f build/ios/ipa/*.ipa
fvm flutter build ipa \
  --flavor "$flavor" \
  --target "$target_file" \
  --build-name "$build_name" \
  --build-number "$build_number"

shopt -s nullglob
ipa_files=(build/ios/ipa/*.ipa)
shopt -u nullglob

if [[ ${#ipa_files[@]} -eq 0 ]]; then
  echo "[ERROR] No IPA file found in build/ios/ipa"
  exit 1
fi

ipa_path="${ipa_files[0]}"
echo "[INFO] IPA ready: $ipa_path"

tmp_key_dir="$(mktemp -d)"
cp "$ASC_API_KEY_PATH" "$tmp_key_dir/AuthKey_${ASC_KEY_ID}.p8"
export API_PRIVATE_KEYS_DIR="$tmp_key_dir"

echo "[INFO] Uploading to TestFlight via xcrun altool..."
xcrun altool \
  --upload-app \
  --type ios \
  --file "$ipa_path" \
  --apiKey "$ASC_KEY_ID" \
  --apiIssuer "$ASC_ISSUER_ID"

echo "[INFO] TestFlight upload completed successfully."

git checkout development
echo "[INFO] Switched back to development branch."
