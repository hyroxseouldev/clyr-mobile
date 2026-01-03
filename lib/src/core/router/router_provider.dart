import 'package:clyr_mobile/src/core/router/session_provider.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/login_page.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/signup_page.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/splash_view.dart';
import 'package:clyr_mobile/src/shared/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'router_provider.g.dart';

final _routerKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  // 1. Auth 상태를 담을 Notifier 생성 및 초기값 설정
  // keepAlive를 사용하여 상태가 도중에 파기되는 것을 방지합니다.
  final session = ref.watch(sessionProvider);
  final authNotifier = ValueNotifier<AsyncValue<User?>>(session);

  ref.onDispose(authNotifier.dispose);

  // 2. sessionProvider의 변화를 감시하여 Notifier 업데이트
  ref.listen<AsyncValue<User?>>(sessionProvider, (previous, next) {
    authNotifier.value = next;
  });

  return GoRouter(
    navigatorKey: _routerKey,
    refreshListenable: authNotifier, // Notifier가 변할 때마다 redirect 실행
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    routes: [
      // ✅ ShellRoute 밖: 로그인/스플래시 (공통 레이아웃 미적용)
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RoutePaths.signup,
        builder: (context, state) => const SignupPage(),
      ),

      // ✅ ShellRoute 안: 홈 및 내부 페이지 (공통 레이아웃 적용)
      ShellRoute(
        builder: (context, state, child) => DefaultLayout(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.home,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Home Screen'))),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final authState = authNotifier.value;
      final location = state.uri.path;

      // [1] 로딩 중 처리:
      // 여기서 다른 경로를 반환하면 GoRouter가 entry 포인트에서 계속 멈출 수 있습니다.
      // null을 반환하여 현재 위치(initialLocation)에 머물게 합니다.
      if (authState is AsyncLoading) return null;

      // [2] 유저 정보 추출
      final User? user = authState.value;
      final bool isLoggedIn = user != null;

      // [3] 미인증 유저 처리
      if (!isLoggedIn) {
        // 현재 위치가 로그인이나 스플래시가 아니라면 로그인으로 보냄
        if (location != RoutePaths.login &&
            location != RoutePaths.splash &&
            location != RoutePaths.signup) {
          return RoutePaths.login;
        }
        return null;
      }

      // [4] 인증된 유저 처리
      if (isLoggedIn) {
        // 이미 접속 중인 상황에서 로그인이나 스플래시에 머물러 있다면 홈으로 이동
        if (location == RoutePaths.login ||
            location == RoutePaths.splash ||
            location == RoutePaths.signup) {
          return RoutePaths.home;
        }
      }

      return null;
    },
  );
}
