import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Main navigation destinations with enhanced enum features
enum MainNavigationItem {
  /// Workout log screen
  log(route: '/log', icon: Icons.description, labelKey: 'navLog'),

  /// Home/Dashboard screen (default)
  home(route: '/home', icon: Icons.home, labelKey: 'navHome'),

  /// Settings/Profile screen
  settings(route: '/settings', icon: Icons.person, labelKey: 'navMy');

  const MainNavigationItem({
    required this.route,
    required this.icon,
    required this.labelKey,
  });

  final String route;
  final IconData icon;
  final String labelKey;

  /// Get the zero-based index of this item
  int get navIndex => MainNavigationItem.values.indexOf(this);

  /// Get the localized label for this navigation item
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return switch (labelKey) {
      'navStats' => l10n.navStats,
      'navLog' => l10n.navLog,
      'navHome' => l10n.navHome,
      'navRanking' => l10n.navRanking,
      'navMy' => l10n.navMy,
      _ => labelKey,
    };
  }

  /// Find the navigation item from a route path
  static MainNavigationItem? fromPath(String path) {
    for (final item in MainNavigationItem.values) {
      if (path.startsWith(item.route)) {
        return item;
      }
    }
    return null;
  }

  /// Find the navigation item from its index
  static MainNavigationItem? fromIndex(int index) {
    if (index >= 0 && index < MainNavigationItem.values.length) {
      return MainNavigationItem.values[index];
    }
    return null;
  }

  /// Create a NavigationDestination widget from this enum value
  NavigationDestination toDestination(BuildContext context) {
    return NavigationDestination(icon: Icon(icon), label: label(context));
  }

  /// Get all navigation destinations as a list
  static List<NavigationDestination> allDestinations(BuildContext context) {
    return MainNavigationItem.values
        .map((item) => item.toDestination(context))
        .toList();
  }
}

/**
 * 랭킹 , 기록, 홈, 커뮤니티, MY  이렇게 다섯개 메뉴
 */
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentItem =
        MainNavigationItem.fromPath(location) ?? MainNavigationItem.home;

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentItem.navIndex,
        onDestinationSelected: (index) {
          final item = MainNavigationItem.fromIndex(index);
          if (item != null) {
            context.go(item.route);
          }
        },
        destinations: MainNavigationItem.allDestinations(context),
      ),
    );
  }
}
