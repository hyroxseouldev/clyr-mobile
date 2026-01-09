import 'package:clyr_mobile/src/core/router/router_provider.dart';
import 'package:clyr_mobile/src/core/theme/theme.dart';
import 'package:clyr_mobile/src/shared/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:clyr_mobile/flavors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    // 테마 모드 감시
    final themeModeAsync = ref.watch(themeModeProvider);

    // 현재 테마 모드 결정 (로딩/에러 시 시스템 기본값)
    final themeMode = themeModeAsync.when(
      data: (mode) => mode,
      loading: () => ThemeMode.system,
      error: (_, __) => ThemeMode.system,
    );

    return MaterialApp.router(
      title: F.title,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ko', 'KR'), Locale('en', 'US')],
      locale: const Locale('ko', 'KR'),
      builder: (context, child) => FlavorBanner(child: child ?? SizedBox()),
      routerConfig: router,
    );
  }
}
