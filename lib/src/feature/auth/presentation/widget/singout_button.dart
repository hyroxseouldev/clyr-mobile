import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/shared/async_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingoutButton extends ConsumerWidget {
  const SingoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.watch(authControllerProvider);
    return AsyncButton(
      onPressed: () {
        ref.read(authControllerProvider.notifier).logout();
      },
      isLoading: controller.isLoading,
      text: l10n.logout,
    );
  }
}
