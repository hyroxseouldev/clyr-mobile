import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = switch (location) {
      '/workout' => 0,
      '/settings' => 1,
      _ => 0,
    };

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          final route = switch (index) {
            0 => '/workout',
            1 => '/settings',
            _ => '/workout',
          };
          context.go(route);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.fitness_center),
            label: 'Workout',
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: '설정'),
        ],
      ),
    );
  }
}
