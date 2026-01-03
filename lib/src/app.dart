import 'package:clyr_mobile/src/core/router/router_provider.dart';
import 'package:clyr_mobile/src/shared/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:clyr_mobile/flavors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: F.title,
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, child) => FlavorBanner(child: child ?? SizedBox()),
      routerConfig: router,
    );
  }
}
