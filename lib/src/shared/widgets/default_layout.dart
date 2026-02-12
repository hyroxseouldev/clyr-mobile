import 'package:clyr_mobile/flavors.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Main navigation destinations with enhanced enum features
enum MainNavigationItem {
  /// Home/Dashboard screen (default)
  home(route: '/home', icon: Icons.home, labelKey: 'navHome'),

  /// Community screen
  community(route: '/community', icon: Icons.people, labelKey: 'navCommunity'),

  /// Program screen
  program(
    route: '/program',
    icon: Icons.fitness_center,
    labelKey: 'navProgram',
  ),

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
      'navCommunity' => l10n.navCommunity,
      'navHome' => l10n.navHome,
      'navProgram' => l10n.navProgram,
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

/// Default layout with main navigation bar
class DefaultLayout extends StatelessWidget {
  const DefaultLayout({
    super.key,
    required this.child,
    this.showBottomNavigation = true,
  });
  final Widget child;
  final bool showBottomNavigation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: showBottomNavigation
          ? _buildNavigationBar(context)
          : null,
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentItem =
        MainNavigationItem.fromPath(location) ?? MainNavigationItem.home;

    return NavigationBar(
      selectedIndex: currentItem.navIndex,
      onDestinationSelected: (index) {
        final item = MainNavigationItem.fromIndex(index);
        if (item != null) {
          context.go(item.route);
        }
      },
      destinations: MainNavigationItem.allDestinations(context),
    );
  }
}

/// Flavor banner for development
class FlavorBanner extends StatelessWidget {
  const FlavorBanner({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withAlpha(150),
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.0,
        letterSpacing: 1.0,
      ),
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}
