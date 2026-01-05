import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

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
        if (error is AppException) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '환영합니다',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '로그인하여 시작하세요',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 48),
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
                    ]),
                  ),
                  const SizedBox(height: 24),
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
                                    .login(
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
                          ? const Loader()
                          : const Text('로그인', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () => context.push('/signup'),
                    child: const Text('계정이 없으신가요? 회원가입'),
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
