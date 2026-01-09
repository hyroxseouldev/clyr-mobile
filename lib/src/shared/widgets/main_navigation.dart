import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/**
 * 랭킹 , 기록, 홈, 커뮤니티, MY  이렇게 다섯개 메뉴 
 */
class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = switch (location) {
      final p when p.startsWith('/stats') => 0,
      final p when p.startsWith('/log') => 1,
      final p when p.startsWith('/home') => 2,
      final p when p.startsWith('/ranking') => 3,
      final p when p.startsWith('/settings') => 4,
      _ => 2,
    };

    void onDestinationSelected(int index) {
      final route = switch (index) {
        0 => '/stats',
        1 => '/log',
        2 => '/home',
        3 => '/ranking',
        4 => '/settings',
        _ => '/home',
      };
      context.go(route);
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.analytics), label: 'Stats'),
          NavigationDestination(icon: Icon(Icons.description), label: 'Log'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Ranking'),
          NavigationDestination(icon: Icon(Icons.person), label: 'My'),
        ],
      ),
    );
  }
}
