# clyr_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

## TestFlight deploy env

- Setup guide: `document/testflight_env_setup.md`
- Env template: `.env.testflight.example`

### iOS TestFlight 배포 방법

아래 명령으로 TestFlight 배포용 환경변수를 로드한 뒤 배포 스크립트를 실행합니다.

```bash
set -a
source env.testflight
set +a
bash scripts/deploy_testflight_ios.sh --flavor prod --version 1.4.0+108
```

- `set -a` / `set +a`: `source env.testflight`로 불러온 변수를 자동 export
- `--flavor prod`: 프로덕션 flavor로 iOS 빌드/배포
- `--version 1.4.0+108`: 앱 버전(`1.4.0`) + 빌드 번호(`108`) 지정

필요 시 버전만 변경해서 동일한 방식으로 재배포할 수 있습니다.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
