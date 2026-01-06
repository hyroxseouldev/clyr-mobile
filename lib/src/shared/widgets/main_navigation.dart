import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = switch (location) {
      final p when p.startsWith('/workout/log') => 1,
      final p when p.startsWith('/settings') => 2,
      _ => 0,
    };

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          final route = switch (index) {
            0 => '/workout',
            1 => '/workout/log',
            2 => '/settings',
            _ => '/workout',
          };
          context.go(route);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          NavigationDestination(
            icon: Icon(Icons.description),
            label: '일지',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}
