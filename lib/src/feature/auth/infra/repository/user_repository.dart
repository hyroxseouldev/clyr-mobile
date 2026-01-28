import 'package:clyr_mobile/src/core/data/auth_data_source.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final authDataSource = ref.read(authDataSourceProvider);
  return UserRepositoryImpl(authDataSource: authDataSource);
}

abstract interface class UserRepository {
  FutureEither<AuthException, void> login(
    ({String email, String password}) params,
  );
  FutureEither<AuthException, void> signup(
    ({String email, String password, String fullName}) params,
  );
  FutureEither<AuthException, void> logout();

  /// 사용자 프로필 조회
  FutureEither<AppException, UserProfileEntity> getUserProfile();

  /// 사용자 프로필 업데이트
  FutureEither<AppException, UserProfileEntity> updateUserProfile(
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
  FutureEither<AppException, bool> checkOnboardingStatus();

  /// 온보딩 데이터 업데이트
  FutureEither<AppException, void> completeOnboarding(
    Map<String, dynamic> data,
  );
}

class UserRepositoryImpl implements UserRepository {
  final AuthDataSource authDataSource;

  UserRepositoryImpl({
    required this.authDataSource,
  });

  @override
  FutureEither<AuthException, void> login(
    ({String email, String password}) params,
  ) async {
    try {
      await authDataSource.login(
        email: params.email,
        password: params.password,
      );
      return right(null);
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> signup(
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
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> logout() async {
    try {
      await authDataSource.logout();
      return right(null);
    } catch (e) {
      return left(AuthException(code: 'logout-error', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, UserProfileEntity> getUserProfile() async {
    try {
      final dto = await authDataSource.getUserProfile();
      return right(dto.toEntity());
    } catch (e) {
      // If profile not found, create new empty profile
      final userId = authDataSource.getCurrentUserId();
      if (userId != null) {
        final newDto = await authDataSource.createUserProfile(accountId: userId);
        return right(newDto.toEntity());
      }
      return left(
        AuthException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }
  }

  @override
  FutureEither<AppException, UserProfileEntity> updateUserProfile(
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
      return left(
        AuthException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
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
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, bool> checkOnboardingStatus() async {
    try {
      final dto = await authDataSource.getUserProfile();
      return right(dto.onboardingCompleted ?? false);
    } catch (e) {
      // If profile doesn't exist, user hasn't completed onboarding
      return right(false);
    }
  }

  @override
  FutureEither<AppException, void> completeOnboarding(
    Map<String, dynamic> data,
  ) async {
    final userId = authDataSource.getCurrentUserId();
    if (userId == null) {
      return left(
        OnboardingException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      await authDataSource.updateUserProfile(
        accountId: userId,
        onboardingCompleted: true,
        onboardingData: data,
      );
      return right(null);
    } catch (e) {
      return left(
        OnboardingException(
          code: 'ONBOARDING_COMPLETE_FAILED',
          message: e.toString(),
        ),
      );
    }
  }
}
