import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/widget/singout_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingMenu {
  final IconData icon;
  final String title;
  final String route;

  SettingMenu({required this.icon, required this.title, required this.route});
}

class SettingView extends HookConsumerWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 프로필 메뉴 와 아이콘 정리
    final List<SettingMenu> settingMenus = [
      SettingMenu(
        icon: Icons.person,
        title: '프로필',
        route: RoutePaths.userProfile,
      ),
      SettingMenu(
        icon: Icons.notifications,
        title: '구매내역',
        route: RoutePaths.purchaseHistory,
      ),
      SettingMenu(
        icon: Icons.help,
        title: '멤버쉽 조회',
        route: RoutePaths.membership,
      ),
      SettingMenu(
        icon: Icons.privacy_tip,
        title: '약관',
        route: RoutePaths.termsOfService,
      ),
      SettingMenu(icon: Icons.info, title: '앱정보', route: RoutePaths.appInfo),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        children: [
          ...settingMenus.map(
            (menu) => ListTile(
              leading: Icon(menu.icon),
              title: Text(menu.title),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                context.push(menu.route);
              },
            ),
          ),

          const SizedBox(height: 8),
          const SingoutButton(),
        ],
      ),
    );
  }
}
