import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/infra/usecase/auth_usecases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_controller.g.dart';

/// 사용자 프로필 컨트롤러
@riverpod
class UserProfileController extends _$UserProfileController {
  @override
  FutureOr<UserProfileEntity> build() async {
    final usecases = ref.read(authUseCasesProvider);
    final result = await usecases.getUserProfile(null);
    return result.fold((l) => throw l, (r) => r);
  }

  /// 프로필 업데이트
  Future<void> updateProfile({
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    List<String>? fitnessGoals,
    FitnessLevel? fitnessLevel,
    Function()? onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(authUseCasesProvider);
      final result = await usecases.updateUserProfile((
        nickname: nickname,
        bio: bio,
        profileImageUrl: profileImageUrl,
        phoneNumber: phoneNumber,
        fitnessGoals: fitnessGoals,
        fitnessLevel: fitnessLevel,
      ));
      return result.fold((l) => throw l, (r) {
        if (onSuccess != null) {
          onSuccess();
        }
        return r;
      });
    });
  }

  /// 프로필 새로고침
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(authUseCasesProvider);
      final result = await usecases.getUserProfile(null);
      return result.fold((l) => throw l, (r) => r);
    });
  }
}
