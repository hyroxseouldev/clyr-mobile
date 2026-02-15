import 'package:clyr_mobile/src/core/data/auth_data_source.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/social/social_login_service.dart';
import 'package:clyr_mobile/src/core/social/social_login_service_provider.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final authDataSource = ref.read(authDataSourceProvider);
  final socialLoginService = ref.read(socialLoginServiceProvider);

  return UserRepositoryImpl(
    authDataSource: authDataSource,
    socialLoginService: socialLoginService,
  );
}

abstract interface class UserRepository {
  FutureEither<void> login(({String email, String password}) params);
  FutureEither<void> signup(
    ({String email, String password, String fullName}) params,
  );
  FutureEither<void> loginWithGoogle();
  FutureEither<void> logout();

  /// 사용자 프로필 조회
  FutureEither<UserProfileEntity> getUserProfile();

  /// 사용자 프로필 업데이트
  FutureEither<UserProfileEntity> updateUserProfile(
    ({
      String? nickname,
      String? bio,
      String? profileImageUrl,
      String? phoneNumber,
      List<String>? fitnessGoals,
      FitnessLevel? fitnessLevel,
    })
    params,
  );

  /// 온보딩 완료 여부 확인
  FutureEither<bool> checkOnboardingStatus();

  /// 온보딩 데이터 업데이트
  FutureEither<void> completeOnboarding(Map<String, dynamic> data);
}

class UserRepositoryImpl implements UserRepository {
  final AuthDataSource authDataSource;
  final SocialLoginService socialLoginService;

  UserRepositoryImpl({
    required this.authDataSource,
    required this.socialLoginService,
  });

  @override
  FutureEither<void> login(({String email, String password}) params) async {
    try {
      await authDataSource.login(
        email: params.email,
        password: params.password,
      );
      return right(null);
    } catch (e) {
      return left(AppException.auth(e.toString()));
    }
  }

  @override
  FutureEither<void> signup(
    ({String email, String password, String fullName}) params,
  ) async {
    try {
      await authDataSource.signup(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );
      return right(null);
    } catch (e) {
      return left(AppException.auth(e.toString()));
    }
  }

  @override
  FutureEither<void> loginWithGoogle() async {
    try {
      final socialResult = await socialLoginService.signInWithGoogle();

      return await socialResult.fold((error) async => left(error), (
        token,
      ) async {
        await authDataSource.loginWithGoogle(
          idToken: token.idToken,
          accessToken: token.accessToken,
        );

        return right(null);
      });
    } catch (e) {
      return left(AppException.auth(e.toString()));
    }
  }

  @override
  FutureEither<void> logout() async {
    try {
      await authDataSource.logout();
      return right(null);
    } catch (e) {
      return left(AppException.auth(e.toString()));
    }
  }

  @override
  FutureEither<UserProfileEntity> getUserProfile() async {
    try {
      final dto = await authDataSource.getUserProfile();
      return right(dto.toEntity());
    } catch (e) {
      // If profile not found, create new empty profile
      final userId = authDataSource.getCurrentUserId();
      if (userId != null) {
        final newDto = await authDataSource.createUserProfile(
          accountId: userId,
        );
        return right(newDto.toEntity());
      }
      return left(AppException.auth('User not authenticated'));
    }
  }

  @override
  FutureEither<UserProfileEntity> updateUserProfile(
    ({
      String? nickname,
      String? bio,
      String? profileImageUrl,
      String? phoneNumber,
      List<String>? fitnessGoals,
      FitnessLevel? fitnessLevel,
    })
    params,
  ) async {
    final userId = authDataSource.getCurrentUserId();
    if (userId == null) {
      return left(AppException.auth('User not authenticated'));
    }

    try {
      final dto = await authDataSource.updateUserProfile(
        accountId: userId,
        nickname: params.nickname,
        bio: params.bio,
        profileImageUrl: params.profileImageUrl,
        phoneNumber: params.phoneNumber,
        fitnessGoals: params.fitnessGoals,
        fitnessLevel: params.fitnessLevel?.name.toUpperCase(),
      );
      return right(dto.toEntity());
    } catch (e) {
      return left(AppException.auth(e.toString()));
    }
  }

  @override
  FutureEither<bool> checkOnboardingStatus() async {
    try {
      final dto = await authDataSource.getUserProfile();
      return right(dto.onboardingCompleted ?? false);
    } catch (e) {
      // If profile doesn't exist, user hasn't completed onboarding
      return right(false);
    }
  }

  @override
  FutureEither<void> completeOnboarding(Map<String, dynamic> data) async {
    final userId = authDataSource.getCurrentUserId();
    if (userId == null) {
      return left(AppException.onboarding('User not authenticated'));
    }

    try {
      await authDataSource.updateUserProfile(
        accountId: userId,
        onboardingCompleted: true,
        onboardingData: data,
      );
      return right(null);
    } catch (e) {
      return left(AppException.onboarding(e.toString()));
    }
  }
}
