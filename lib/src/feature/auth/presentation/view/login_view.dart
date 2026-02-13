import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/config/app_info.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/error/exception_localization.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/shared/widgets/loader.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
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
              content: Text(error.getLocalizedMessage(l10n)),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final horizontalPadding = (screenWidth * 0.08).clamp(24.0, 120.0);
            final formMaxWidth = screenWidth >= 900 ? 520.0 : 460.0;
            final logoFontSize = screenWidth >= 700 ? 64.0 : 56.0;
            final logoToFormSpacing = screenWidth >= 700 ? 76.0 : 52.0;
            final logoAreaHeight = (logoFontSize + 22) * 2;

            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontalPadding,
                28,
                horizontalPadding,
                16,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: formMaxWidth),
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
                        const SizedBox(height: 20),
                        SizedBox(
                          height: logoAreaHeight,
                          child: Center(
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  AppInfo.appLogoText,
                                  speed: 120.ms,
                                  cursor: '',
                                  textStyle: TextStyle(
                                    color: const Color(0xFF0F172A),
                                    fontSize: logoFontSize,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 8,
                                    shadows: const [
                                      Shadow(
                                        color: Color(0x22000000),
                                        offset: Offset(0, 2),
                                        blurRadius: 6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          l10n.loginSubtitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 15,
                          ),
                        ).animate().fadeIn(delay: 80.ms, duration: 350.ms),
                        SizedBox(height: logoToFormSpacing),
                        FormBuilderTextField(
                          name: 'email',
                          decoration: InputDecoration(
                            labelText: l10n.email,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: l10n.emailRequired,
                            ),
                            FormBuilderValidators.email(
                              errorText: l10n.emailInvalid,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        FormBuilderTextField(
                          name: 'password',
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: l10n.password,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: l10n.passwordRequired,
                            ),
                          ]),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: canSubmit
                                ? () {
                                    if (formKey.currentState
                                            ?.saveAndValidate() ??
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
                                : Text(
                                    l10n.loginButton,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(
                                  context,
                                ).dividerColor.withValues(alpha: 0.5),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              l10n.orContinueWith,
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.color,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Divider(
                                color: Theme.of(
                                  context,
                                ).dividerColor.withValues(alpha: 0.5),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.g_mobiledata, size: 28),
                          label: Text(l10n.continueWithGoogle),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                        const SizedBox(height: 10),
                        OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.apple, size: 20),
                          label: Text(l10n.continueWithApple),
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => context.push('/signup'),
                          child: Text(l10n.noAccount),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
