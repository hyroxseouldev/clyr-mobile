import 'package:clyr_mobile/src/core/router/session_provider.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/login_view.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/signup_view.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/splash_view.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/view/user_profile_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/app_info_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/membership_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/purchase_history_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/terms_of_service_view.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/settings_view.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/view/program_detail_view.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/view/workout_view.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/view/workout_start_date_setup_view.dart';
import 'package:clyr_mobile/src/shared/widgets/main_navigation.dart';
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
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: RoutePaths.signup,
        builder: (context, state) => const SignupView(),
      ),

      // ✅ ShellRoute: 바텀 네비게이션
      ShellRoute(
        builder: (context, state, child) => MainNavigation(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.workout,
            builder: (context, state) => const WorkoutView(),
            routes: [
              GoRoute(
                path: 'program/:id',
                builder: (context, state) {
                  final programId = state.pathParameters['id']!;
                  final workoutId = state.uri.queryParameters['workoutId'];
                  return ProgramDetailView(
                    programId: programId,
                    workoutId: workoutId,
                  );
                },
                routes: [
                  GoRoute(
                    path: 'start-date-setup',
                    builder: (context, state) {
                      final programId = state.pathParameters['id']!;
                      return WorkoutStartDateSetupView(programId: programId);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: RoutePaths.settings,
            builder: (context, state) => const SettingView(),
            routes: [
              GoRoute(
                path: 'profile',
                builder: (context, state) => const UserProfileView(),
              ),
              GoRoute(
                path: 'purchase-history',
                builder: (context, state) => const PurchaseHistoryView(),
              ),
              GoRoute(
                path: 'membership',
                builder: (context, state) => const MembershipView(),
              ),
              GoRoute(
                path: 'terms',
                builder: (context, state) => const TermsOfServiceView(),
              ),
              GoRoute(
                path: 'app-info',
                builder: (context, state) => const AppInfoView(),
              ),
            ],
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
        if (location != RoutePaths.login &&
            location != RoutePaths.splash &&
            location != RoutePaths.signup) {
          return RoutePaths.login;
        }
        return null;
      }

      // [4] 인증된 유저 처리
      if (isLoggedIn) {
        if (location == RoutePaths.login ||
            location == RoutePaths.splash ||
            location == RoutePaths.signup) {
          return RoutePaths.workout;
        }
      }

      return null;
    },
  );
}
