import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/core/theme/theme.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/user_profile_controller.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/widget/singout_button.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/widget/user_avatar_card_widget.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
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
    final l10n = AppLocalizations.of(context)!;
    // 프로필 메뉴 와 아이콘 정리
    final List<SettingMenu> settingMenus = [
      SettingMenu(
        icon: Icons.notifications,
        title: l10n.settingsPurchaseHistory,
        route: RoutePaths.purchaseHistory,
      ),
      SettingMenu(
        icon: Icons.help,
        title: l10n.settingsMembership,
        route: RoutePaths.membership,
      ),
      SettingMenu(
        icon: Icons.privacy_tip,
        title: l10n.settingsTerms,
        route: RoutePaths.termsOfService,
      ),
      SettingMenu(
        icon: Icons.info,
        title: l10n.settingsAppInfo,
        route: RoutePaths.appInfo,
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        children: [
          // 사용자 프로필 카드
          AsyncWidget<UserProfileEntity>(
            minHeight: 240,
            data: ref.watch(userProfileControllerProvider),
            builder: (userProfile) {
              return UserAvatarCard(
                userAvatarUrl: userProfile.profileImageUrl ?? '',
                userName: userProfile.nickname ?? l10n.settingsDefaultUserName,
                onEditPressed: () => context.push(RoutePaths.userProfile),
              );
            },
          ),
          const SizedBox(height: 16),

          // 테마 설정
          const ThemeModeToggle(),
          const Divider(height: 32),

          // 기존 메뉴들
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
          SingoutButton(buttonText: l10n.logout),
        ],
      ),
    );
  }
}
