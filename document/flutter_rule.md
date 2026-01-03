# Flutter 앱 개발 가이드 라인

1. 상대 경로는 사용하지 않습니다. '../..' 절대금지
2. Flutter 최신 문서를 참고하여 개발합니다.
3. Entity 를 활용한 Widget 의 경우 factory 메서드로 fromEntity 함수를 만들어 사용합니다.
4. 네트워크나, 패키지에서 사용되는 Client 객체들은 여러곳에서 중복하여 쓰지 않고 provider 로 최 상단에서 주입하여 사용합니다.

# 비동기 에러처리

# 아키텍처 및 구조

- Data

  - dto: JsonSerializer 로 구현합니다. 실제 데이터를 Dart 객체로 변환 합니다. . toEntity 함수를 필수적으로 생성합니다.
  - data_source : 데이터의 주체가 되는 부분입니다. dio 를 사용할 경우에는 사용합니다.
  - repositroy: Feature 의 CRUD 기능이 들어간 객체입니다.

- Infra

  - entity: 실제 앱에서 보여지는 데이터들로만 이루어진 객체입니다.
  - usecase: 추상클래스를 사용하며 params 는 namedRecord 를 사용하여 컨트롤러내에서 간편하게 사용합니다.

- Presentation
  - provider: view 를 컨트롤하는 컨트롤러입니다. riverpod notifier 를 알맞게 사용합니다.
  - view: 화면입니다.
  - widget: 위젯입니다. entity 를 사용할 경우 factory 메서드를 활용합니다.

으로 나뉘어진 클린 아키 텍처 구조 입니다.

# Form

Flutter Hooks + Riverpod + Form Builder를 조합하여여 사용합니다

1. 사용자가 폼 데이터를 입력한다.
2. 형식이 맞아야 버튼이 활성화된다.
3. 가입 버튼 클릭시 로딩 애니메이션이 돌아간다.
4. 실패시 토스트를 띄운다.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// 1. 서버 통신 상태를 관리하는 간단한 Provider (예시용)
final signupControllerProvider = StateNotifierProvider<SignupController, AsyncValue<void>>((ref) {
return SignupController();
});

class SignupController extends StateNotifier<AsyncValue<void>> {
SignupController() : super(const AsyncData(null));

Future<void> submit(Map<String, dynamic> data) async {
state = const AsyncLoading();
// 실제 API 호출을 흉내냅니다 (2초 대기)
await Future.delayed(const Duration(seconds: 2));
state = const AsyncData(null);
// 실제로는 여기서 에러 처리를 위해 AsyncValue.guard 등을 사용합니다.
}
}

class ReactiveSignupScreen extends HookConsumerWidget {
const ReactiveSignupScreen({super.key});

@override
Widget build(BuildContext context, WidgetRef ref) {
// Hooks: 폼 상태를 제어하기 위한 Key와 버튼 활성화 상태 관리
final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
final isFormValid = useState(false);

    // Riverpod: 서버 통신 상태 감시
    final signupState = ref.watch(signupControllerProvider);
    final isLoading = signupState is AsyncLoading;

    // 버튼 활성화 조건: 폼이 유효하고, 로딩 중이 아닐 때
    final canSubmit = isFormValid.value && !isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: formKey,
          // 폼의 값이 바뀔 때마다 실시간 유효성 검사 (Reactive!)
          onChanged: () {
            // saveAndValidate()를 호출하면 필드들의 에러 메시지를 업데이트하고 결과를 반환합니다.
            isFormValid.value = formKey.currentState?.saveAndValidate(focusOnInvalid: false) ?? false;
          },
          child: Column(
            children: [
              // 이메일 필드
              FormBuilderTextField(
                name: 'email',
                decoration: const InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '이메일을 입력해주세요.'),
                  FormBuilderValidators.email(errorText: '올바른 이메일 형식이 아닙니다.'),
                ]),
              ),
              const SizedBox(height: 16),

              // 비밀번호 필드
              FormBuilderTextField(
                name: 'password',
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: '비밀번호를 입력해주세요.'),
                  FormBuilderValidators.minLength(6, errorText: '최소 6자 이상 입력해주세요.'),
                ]),
              ),
              const SizedBox(height: 32),

              // ✅ 반응형 가입 버튼
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  // 조건에 따라 onPressed를 null로 설정하여 버튼을 비활성화
                  onPressed: canSubmit
                    ? () {
                        final data = formKey.currentState!.value;
                        ref.read(signupControllerProvider.notifier).submit(data);
                      }
                    : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('가입하기', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );

}
}
