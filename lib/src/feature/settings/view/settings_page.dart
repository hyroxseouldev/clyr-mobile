import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/widget/singout_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('프로필'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 프로필 페이지
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('알림'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 알림 설정
            },
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('도움말'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // TODO: 도움말
            },
          ),
          const Divider(height: 1),
          const SizedBox(height: 8),
          const SingoutButton(),
        ],
      ),
    );
  }
}
