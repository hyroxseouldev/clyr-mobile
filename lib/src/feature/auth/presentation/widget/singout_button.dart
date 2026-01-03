import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/shared/async_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SingoutButton extends ConsumerWidget {
  const SingoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(authControllerProvider);
    return AsyncButton(
      onPressed: () {
        ref.read(authControllerProvider.notifier).logout();
      },
      isLoading: controller.isLoading,
      text: '로그아웃',
    );
  }
}
