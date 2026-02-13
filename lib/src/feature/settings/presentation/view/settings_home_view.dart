import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/user_profile_controller.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/settings_list_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/widget/user_avatar_card_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsHomeView extends HookConsumerWidget {
  const SettingsHomeView({super.key});
  static const String routeName = 'settings_home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final userProfileState = ref.watch(userProfileControllerProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.pushNamed(SettingsListView.routeName),
          ),
        ],
      ),
      body: ListView(
        children: [
          // 사용자 프로필 카드 (clickable)
          AsyncWidget<UserProfileEntity>(
            minHeight: 240,
            data: userProfileState,
            builder: (userProfile) {
              return UserAvatarCard(
                userAvatarUrl: userProfile.profileImageUrl ?? '',
                userName: userProfile.nickname ?? l10n.settingsDefaultUserName,
                onEditPressed: () => context.push(RoutePaths.userProfile),
              );
            },
          ),
          const SizedBox(height: 16),

          // My Classes
          ListTile(
            leading: const Icon(Icons.class_outlined),
            title: Text(l10n.settingsMyClasses),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(RoutePaths.myClasses),
          ),
        ],
      ),
    );
  }
}
