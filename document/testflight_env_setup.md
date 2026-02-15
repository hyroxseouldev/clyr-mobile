# TestFlight env setup

## 1) Create local env file

```bash
cp .env.testflight.example .env.testflight
```

Update `.env.testflight` values:

```bash
ASC_KEY_ID=AB12CD34EF
ASC_ISSUER_ID=11111111-2222-3333-4444-555555555555
ASC_API_KEY_PATH=/Users/yourname/.keys/AuthKey_AB12CD34EF.p8
```

- `ASC_API_KEY_PATH` must be an absolute path to your `.p8` file.
- `.env.testflight` is ignored by git.

## 2) Load env and deploy

```bash
set -a
source .env.testflight
set +a

scripts/deploy_testflight_ios.sh --flavor prod --version 1.4.0+108
```

## 3) Where to get values from App Store Connect

1. Open App Store Connect.
2. Go to `Users and Access`.
3. Open the `Integrations` tab.
4. Select `App Store Connect API`.
5. Create API Key (or use an existing one).

You will get:
- `Key ID` -> use as `ASC_KEY_ID`
- `Issuer ID` -> use as `ASC_ISSUER_ID`
- `.p8` key file (download once) -> save locally and use absolute file path as `ASC_API_KEY_PATH`

## 4) Quick validation

```bash
echo "$ASC_KEY_ID"
echo "$ASC_ISSUER_ID"
ls -l "$ASC_API_KEY_PATH"
```

If the `ls` command prints the file, your path is valid.
