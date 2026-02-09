import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/auth_controller.dart';
import 'package:clyr_mobile/src/core/theme/theme_mode_provider.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class SettingsListView extends HookConsumerWidget {
  const SettingsListView({super.key});
  static const String routeName = 'settings_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final themeModeAsync = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsMenu)),
      body: ListView(
        children: [
          // Theme Section
          AsyncWidget<ThemeMode>(
            data: themeModeAsync,
            builder: (currentMode) => Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.light_mode),
                  title: Text(l10n.settingsThemeLight),
                  trailing: currentMode == ThemeMode.light
                      ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.light),
                ),
                ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: Text(l10n.settingsThemeDark),
                  trailing: currentMode == ThemeMode.dark
                      ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.dark),
                ),
                ListTile(
                  leading: const Icon(Icons.brightness_auto),
                  title: Text(l10n.settingsThemeSystem),
                  trailing: currentMode == ThemeMode.system
                      ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
                      : null,
                  onTap: () => ref.read(themeModeProvider.notifier).setThemeMode(ThemeMode.system),
                ),
              ],
            ),
          ),
          const Divider(),

          // Menu Items
          ListTile(
            leading: const Icon(Icons.receipt_long),
            title: Text(l10n.settingsPurchaseHistory),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(RoutePaths.purchaseHistory),
          ),
          ListTile(
            leading: const Icon(Icons.card_membership),
            title: Text(l10n.settingsMembership),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(RoutePaths.membership),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: Text(l10n.settingsTerms),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(RoutePaths.termsOfService),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settingsAppInfo),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push(RoutePaths.appInfo),
          ),
          const Divider(),

          // Logout
          ListTile(
            leading: Icon(Icons.logout, color: Theme.of(context).colorScheme.error),
            title: Text(l10n.logout, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            onTap: () => _showLogoutDialog(context, ref, l10n),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(authControllerProvider.notifier).logout();
            },
            child: Text(l10n.logout),
          ),
        ],
      ),
    );
  }
}
