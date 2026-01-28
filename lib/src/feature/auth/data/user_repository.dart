import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'user_repository.g.dart';

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  final supabase = ref.read(supabaseClientProvider);
  return UserRepositoryImpl(supabase: supabase);
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
  FutureEither<AppException, void> completeOnboarding(Map<String, dynamic> data);
}

class UserRepositoryImpl implements UserRepository {
  final sb.SupabaseClient supabase;
  UserRepositoryImpl({required this.supabase});

  @override
  FutureEither<AuthException, void> login(
    ({String email, String password}) params,
  ) async {
    try {
      await supabase.auth.signInWithPassword(
        email: params.email,
        password: params.password,
      );
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> signup(
    ({String email, String password, String fullName}) params,
  ) async {
    try {
      await supabase.auth.signUp(
        email: params.email,
        password: params.password,
        data: {'full_name': params.fullName, 'role': 'USER', 'avatar_url': ''},
      );
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AuthException, void> logout() async {
    try {
      await supabase.auth.signOut();
      return right(null);
    } on sb.AuthException catch (e) {
      return left(AuthException(code: e.code ?? 'unknown', message: e.message));
    } catch (e) {
      return left(AuthException(code: 'logout-error', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, UserProfileEntity> getUserProfile() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        AuthException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      final response = await supabase
          .from('user_profile')
          .select()
          .eq('account_id', userId)
          .maybeSingle();

      if (response == null) {
        // 프로필이 없는 경우 새로 생성
        final newProfile = UserProfileEntity(accountId: userId);
        return right(newProfile);
      }

      final dto = UserProfileDto.fromJson(response);
      return right(dto.toEntity());
    } catch (e) {
      print('getUserProfile: error = $e');
      return left(AuthException(code: 'unknown', message: e.toString()));
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
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        AuthException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      // 기존 프로필 확인
      final existing = await supabase
          .from('user_profile')
          .select('id')
          .eq('account_id', userId)
          .maybeSingle();

      final updateData = <String, dynamic>{
        if (params.nickname != null) 'nickname': params.nickname,
        if (params.bio != null) 'bio': params.bio,
        if (params.profileImageUrl != null)
          'profile_image_url': params.profileImageUrl,
        if (params.phoneNumber != null) 'phone_number': params.phoneNumber,
        if (params.fitnessGoals != null) 'fitness_goals': params.fitnessGoals,
        if (params.fitnessLevel != null)
          'fitness_level': params.fitnessLevel?.name.toUpperCase(),
        'updated_at': DateTime.now().toIso8601String(),
      };

      if (existing == null) {
        // 신규 생성
        final response = await supabase
            .from('user_profile')
            .insert({...updateData, 'account_id': userId})
            .select()
            .single();
        final dto = UserProfileDto.fromJson(response);
        return right(dto.toEntity());
      } else {
        // 업데이트
        final response = await supabase
            .from('user_profile')
            .update(updateData)
            .eq('account_id', userId)
            .select()
            .single();
        final dto = UserProfileDto.fromJson(response);
        return right(dto.toEntity());
      }
    } catch (e) {
      return left(AuthException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, bool> checkOnboardingStatus() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        OnboardingException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      final response = await supabase
          .from('user_profile')
          .select('onboarding_completed')
          .eq('account_id', userId)
          .maybeSingle();

      if (response == null) {
        return right(false);
      }

      final isOnboarded = response['onboarding_completed'] as bool? ?? false;
      return right(isOnboarded);
    } catch (e) {
      print('checkOnboardingStatus: error = $e');
      return left(
        OnboardingException(code: 'ONBOARDING_CHECK_FAILED', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, void> completeOnboarding(
      Map<String, dynamic> data) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        OnboardingException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      await supabase.from('user_profile').update({
        'onboarding_completed': true,
        'onboarding_data': data,
        'onboarding_completed_at': DateTime.now().toIso8601String(),
        'updated_at': DateTime.now().toIso8601String(),
      }).eq('account_id', userId);

      return right(null);
    } catch (e) {
      print('completeOnboarding: error = $e');
      return left(
        OnboardingException(code: 'ONBOARDING_COMPLETE_FAILED', message: e.toString()),
      );
    }
  }
}
