import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/auth/infra/repository/user_repository.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';

/// 사용자 프로필 조회 UseCase
class GetUserProfileUseCase implements Usecase<void, UserProfileEntity> {
  final UserRepository _repository;

  GetUserProfileUseCase(this._repository);

  @override
  FutureEither<UserProfileEntity> call(void input) {
    return _repository.getUserProfile();
  }
}

/// 사용자 프로필 업데이트 UseCase
class UpdateUserProfileUseCase
    implements Usecase<UpdateUserProfileParams, UserProfileEntity> {
  final UserRepository _repository;

  UpdateUserProfileUseCase(this._repository);

  @override
  FutureEither<UserProfileEntity> call(UpdateUserProfileParams input) {
    return _repository.updateUserProfile(input);
  }
}

/// UpdateUserProfileUseCase 파라미터
typedef UpdateUserProfileParams = ({
  String? nickname,
  String? bio,
  String? profileImageUrl,
  String? phoneNumber,
  List<String>? fitnessGoals,
  FitnessLevel? fitnessLevel,
});
