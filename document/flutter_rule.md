# 🚀 Flutter Development Guidelines

이 문서는 프로젝트의 일관성, 유지보수성 및 확장성을 위해 준수해야 할 핵심 가이드라인을 정의합니다.

## 1. 일반 원칙 (General Principles)

- **절대 경로 사용:** 패키지 내부에서 상대 경로(`../..`)를 절대 사용하지 않습니다. 반드시 `package:project_name/...` 형태의 **절대 경로**를 사용합니다.
- **최신성 유지:** Flutter 및 Riverpod(v3+) 최신 문서를 참고하여 선언적 UI 패턴을 유지합니다.
- **의존성 주입 (DI):** 네트워크 클라이언트(Dio 등)나 외부 패키지 객체는 직접 생성하지 않고, **Provider를 통해 최상단에서 주입**하여 싱글톤처럼 관리합니다.
- StatefuleWidget 사용을 지양하고 Flutter Hooks 를 우선적으로 사용합니다.
- Either 를 적극 사용하여 예기치 못한 에러를 방지합니다.

### 파일 명 가이드 라인

### Presentation Layer

- 모든 디렉토리와 파일명은 소문자와 언더스코어(snake_case)를 사용합니다.
- 모든 화면(Page/Screen) 단위의 파일은 \_view.dart 접미사를 사용합니다. 클래스명은 View 를 사용합니다.
- 단순 컴포넌트는 **\_widget.dart**를 사용하여 View와 위젯의 위계를 분리합니다.

## 이는 라우팅(Routing) 설정 시 어떤 파일이 실제 화면인지 빠르게 식별하기 위함입니다.

## 2. 아키텍처 구조 (Clean Architecture)

본 프로젝트는 **Data - Infra - Presentation** 3계층 구조를 따릅니다.

### 📂 Data Layer (원천 데이터 처리)

- **DTO (Data Transfer Object):** `JsonSerializer`를 사용하여 구현합니다. 서버의 데이터를 Dart 객체로 매핑하며, 반드시 `toEntity()` 메서드를 포함해야 합니다.
- **Data Source:** 데이터의 실제 소스(API, Local DB 등)와 통신하는 부분입니다. (예: Dio 사용)
- **Repository:** Feature별 CRUD 기능을 담당하며, Data Source를 추상화하여 제공합니다.

### 📂 Infra Layer (도메인 및 비즈니스 로직)

- **Entity:** 앱 내 UI에서 실제로 사용하는 핵심 데이터 모델입니다. 가급적 불변(Immutable) 상태를 유지합니다.
- **Usecase:** 비즈니스 로직의 단위입니다. 추상 클래스로 정의하며, `params`는 **Named Record**를 사용하여 Controller에서의 가독성을 높입니다. UseCase 의 provider 는 통합하여 사용합니다.

### 📂 Presentation Layer (UI 및 상태 관리)

- **Provider:** View의 상태를 제어하는 Controller 역할을 합니다. `Riverpod Notifier`를 적절히 사용합니다.
- **View:** 실제 화면 구성을 담당합니다.
- **Widget:** 화면을 구성하는 컴포넌트입니다. **Entity를 사용하는 위젯은 `factory` 메서드로 `fromEntity` 함수를 만들어 생성**합니다.

---

## 3. 🏛️ 아키텍쳐 개발 플로우 가이드라인

우리 프로젝트는 **Data - Infra - Presentation**의 3계층 구조를 따르며, 각 계층은 엄격한 역할 분담과 에러 처리 규칙을 가집니다.

### 1. 계층별 역할 및 데이터 흐름

| 계층 (Layer)     | 주요 구성 요소                           | 역할 및 데이터 변환                                                                         |
| ---------------- | ---------------------------------------- | ------------------------------------------------------------------------------------------- |
| **Data**         | `dto`, `data_source`, `repository`       | 외부 SDK(Supabase, Dio 등)와 통신. 외부 에러를 `AppException`으로 변환.                     |
| **Infra**        | `entity`, `usecase`                      | 순수한 비즈니스 로직 정의. `Entity`와 `Named Record`를 사용하여 규격화된 데이터 전달.       |
| **Presentation** | `provider(controller)`, `view`, `widget` | UI 상태 관리. `AsyncValue.guard`를 이용한 에러 캡처 및 `Extension`을 통한 에러 메시지 노출. |

---

### 2. 레이어간 에러 처리 규칙 (Error Handling)

- **Data Layer (Repository):** \* 외부 라이브러리(예: `sb.AuthException`)의 에러를 `catch`하여, 반드시 우리 프로젝트의 정의된 **`AppException`**으로 매핑하여 반환합니다.
- 외부 의존성이 상위 레이어(UseCase, Controller)로 새어 나가지 않도록 격리합니다.

- **Presentation Layer (Controller):** \* `AsyncValue.guard` 또는 `fold`를 사용하여 `AppException`을 상태(`state`)의 `error` 필드에 담습니다.
- 컨트롤러 내부에 메시지 가공 로직을 두지 않습니다.

- **UI Layer (View):** \* `ref.listen`을 통해 에러를 감지하고, `AppException`에 정의된 **Extension(`displayMessage`)**을 호출하여 사용자에게 메시지를 노출합니다.

---

### 3. 데이터 통신 및 변환 (DTO & Entity)

- **DTO (Data Transfer Object):** \* 서버/SDK에서 오는 원시 데이터(JSON)를 처리합니다.
- 반드시 `toEntity()` 메서드를 구현하여 `Infra` 계층에서 사용할 수 있는 형태로 변환합니다.

- **Entity:** \* UI에서 필요한 필드만 포함하는 불변(Immutable) 객체입니다.
- 위젯에서 Entity를 사용할 경우, 가이드라인에 따라 **`factory Widget.fromEntity(Entity entity)`** 메서드를 활용하여 위젯 생성을 규격화합니다.

---

### 4. 코드 구현 핵심 원칙 (Coding Convention)

1. **Interface & Implementation:** \* Repository와 UseCase는 반드시 `abstract interface class`로 규격을 정의하고, 이를 `implements` 하여 구현합니다.
2. **Named Record:** \* UseCase와 Repository의 매개변수는 가독성과 유지보수를 위해 **Named Record** `({Type param1, Type param2})` 형식을 필수적으로 사용합니다.
3. **Dependency Injection:** \* `SupabaseClient`, `Dio` 등 외부 클라이언트 객체는 최상단 Provider에서 주입받아 사용하며, `ref.watch`를 통해 의존성을 관리합니다.
4. **Extension Logic:** \* 반복되는 유효성 검사나 에러 메시지 매핑 로직은 클래스 내부에 두지 않고 `extension`으로 분리하여 응집도를 높입니다.

---

### 5. 데이터 흐름 요약 (Summary Flow)

1. **UI:** 컨트롤러의 메서드 호출 (예: `ref.read(authControllerProvider.notifier).login(...)`)
2. **Controller:** UseCase 호출 및 `AsyncValue` 상태 관리
3. **UseCase:** 비즈니스 로직 수행 및 Repository 호출
4. **Repository:** 외부 통신 후 `DTO`를 `Entity`로 변환하여 `Either(Left: AppException, Right: Entity)` 반환
5. **UI:** `ref.listen`에서 에러 발생 시 `SnackBar` 노출 또는 데이터 화면 갱신

---

## 4. 비동기 에러 처리 (Async Error Handling)

- `AsyncValue`를 적극 활용하여 로딩, 데이터 성공, 에러 상태를 선언적으로 관리합니다.
- `AsyncValue.guard` 등을 사용하여 예상치 못한 런타임 에러를 방지합니다.
- 모든 비동기 에러는 AppException (Sealed Class)으로 처리합니다.
- 에러 메시지 매핑은 AppExceptionX라는 Extension을 만들어서 message 필드로 제공합니다.
- Supabase의 AuthException 이라는 객체가 존재합니다. 이는 겹칠 우려가 있어 as sb 로 구분합니다.

---

## 5. Form 구현 가이드

**Flutter Hooks + Riverpod + Form Builder** 조합을 사용하여 반응형 폼을 구현합니다.

### ✅ 구현 요구사항

1. 사용자 입력 실시간 감지
2. 유효성 검사(Validation) 통과 시에만 버튼 활성화
3. 제출(Submit) 시 로딩 애니메이션 표시
4. 실패 시 토스트 메시지 알림

### 📝 표준 구현 예시

```dart
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// [Controller] 서버 통신 상태 관리
final signupControllerProvider = StateNotifierProvider<SignupController, AsyncValue<void>>((ref) {
  return SignupController();
});

class SignupController extends StateNotifier<AsyncValue<void>> {
  SignupController() : super(const AsyncData(null));

  Future<void> submit(Map<String, dynamic> data) async {
    state = const AsyncLoading();
    // AsyncValue.guard를 사용하여 비동기 에러를 안전하게 캡처합니다.
    state = await AsyncValue.guard(() async {
      await Future.delayed(const Duration(seconds: 2)); // API 호출 시뮬레이션
    });
  }
}

// [View] 반응형 회원가입 화면
class ReactiveSignupScreen extends HookConsumerWidget {
  const ReactiveSignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Hooks: 폼 상태 및 유효성 관리
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final isFormValid = useState(false);

    // Riverpod: 통신 상태 감시
    final signupState = ref.watch(signupControllerProvider);
    final isLoading = signupState is AsyncLoading;

    // 버튼 활성화 조건: 유효성 통과 & 로딩 중 아님
    final canSubmit = isFormValid.value && !isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: formKey,
          onChanged: () {
            // 값이 바뀔 때마다 상태 업데이트 (반응형 버튼 활성화를 위함)
            isFormValid.value = formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false;
          },
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(labelText: '이메일', prefixIcon: Icon(Icons.email)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '이메일을 입력해주세요.'),
                  FormBuilderValidators.email(errorText: '올바른 이메일 형식이 아닙니다.'),
                ]),
              ),
              const SizedBox(height: 16),
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(labelText: '비밀번호', prefixIcon: Icon(Icons.lock)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '비밀번호를 입력해주세요.'),
                  FormBuilderValidators.minLength(6, errorText: '최소 6자 이상 입력해주세요.'),
                ]),
              ),
              const SizedBox(height: 32),

              // 반응형 제출 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: canSubmit
                    ? () => ref.read(signupControllerProvider.notifier).submit(formKey.currentState!.value)
                    : null,
                  child: isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Text('가입하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

```

## 🎨 Presentation: Provider 구현 원칙

### 1. Notifier 위주의 상태 관리

- **원칙:** 단순 데이터 제공이 아닌 이상 `StateProvider`나 `ChangeNotifier` 대신 **`Notifier`** 또는 **`AsyncNotifier`**를 우선적으로 사용합니다.
- **이유:** `riverpod_annotation`을 통한 코드 생성(Code Generation)을 활용하여 컴파일 타임 안정성과 일관성을 확보하기 위함입니다.

### 2. 단일 상태(Single State)와 AsyncValue 활용

- **원칙:** 화면의 주요 상태는 **`AsyncValue<T>`** 하나로 관리합니다.
- **세부 규칙:**
- 로딩, 에러, 데이터 성공 상태를 별도의 `bool isLoading` 변수로 쪼개지 않습니다.
- `state = const AsyncLoading()`과 `AsyncValue.guard`를 사용하여 상태 전환을 명확히 합니다.

### 3. 비즈니스 로직의 위임 (Slim Controller)

- **원칙:** 컨트롤러는 **"상태 변경"**과 **"UseCase 호출"**만 담당하며, 복잡한 비즈니스 계산이나 데이터 가공 로직을 직접 수행하지 않습니다.
- **흐름:** `UI 이벤트 수신` → `상태를 Loading으로 변경` → `UseCase 호출` → `결과를 state에 반영`.

### 4. 에러 메시지 가공 금지 (Stateless Error)

- **원칙:** 컨트롤러 내부에 `String? errorMessage` 같은 변수를 두지 않습니다.
- **이유:** 에러 정보는 `state` (AsyncError) 객체 안에 이미 포함되어 있습니다. 메시지 변환은 `AppException`의 **Extension**에 위임하여 UI 레이어에서 처리합니다.

### 5. Side Effect 처리 (Listen, Not Read)

- **원칙:** 성공 시 내비게이션(화면 이동)이나 실패 시 스낵바 출력 같은 사이드 이펙트는 컨트롤러 내부가 아닌 **View의 `ref.listen`**에서 처리합니다.
- **이유:** 컨트롤러가 `BuildContext`에 의존하는 것을 방지하고, 단위 테스트가 용이한 순수 Dart 클래스를 유지하기 위함입니다.

---

### 📝 표준 구현 템플릿 (Template)

```dart
@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() => null; // 1. 초기 상태 정의

  Future<void> login(({String email, String password}) params) async {
    // 2. 상태를 로딩으로 전환
    state = const AsyncLoading();

    // 3. UseCase 호출 및 결과 반영 (AsyncValue.guard 활용)
    state = await AsyncValue.guard(() async {
      final usecase = ref.read(authUseCaseProvider);
      final result = await usecase.login(params);

      // Result 타입을 사용하는 경우 에러를 throw하여 guard가 캡처하게 함
      return result.fold((l) => throw l, (r) => r);
    });
  }
}

```
