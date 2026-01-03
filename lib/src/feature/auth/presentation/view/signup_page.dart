import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final isFormValid = useState(false);

    final authState = ref.watch(authControllerProvider);
    final isLoading = authState is AsyncLoading;

    final canSubmit = isFormValid.value && !isLoading;

    ref.listen(authControllerProvider, (previous, next) {
      if (next is AsyncError) {
        final error = next.error;
        if (error is AuthException) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.displayMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('회원가입')),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: FormBuilder(
              key: formKey,
              onChanged: () {
                isFormValid.value =
                    formKey.currentState?.saveAndValidate(
                      focusOnInvalid: false,
                    ) ??
                    false;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '계정 만들기',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '이메일과 비밀번호를 입력해주세요',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: const InputDecoration(
                      labelText: '이메일',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: '이메일을 입력해주세요.'),
                      FormBuilderValidators.email(
                        errorText: '올바른 이메일 형식이 아닙니다.',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'password',
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: '비밀번호를 입력해주세요.',
                      ),
                      FormBuilderValidators.minLength(
                        6,
                        errorText: '비밀번호는 최소 6자 이상이어야 합니다.',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'confirmPassword',
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호 확인',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: '비밀번호 확인을 입력해주세요.',
                      ),
                      (val) {
                        if (val !=
                            formKey.currentState?.fields['password']?.value) {
                          return '비밀번호가 일치하지 않습니다.';
                        }
                        return null;
                      },
                    ]),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: canSubmit
                          ? () {
                              if (formKey.currentState?.saveAndValidate() ??
                                  false) {
                                final data = formKey.currentState!.value;
                                ref
                                    .read(authControllerProvider.notifier)
                                    .signup(
                                      data['email'] as String,
                                      data['password'] as String,
                                    );
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Text('가입하기', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('이미 계정이 있으신가요? 로그인'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
