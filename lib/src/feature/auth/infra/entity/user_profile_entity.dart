import 'package:clyr_mobile/src/feature/auth/data/user_profile_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    required String accountId,
    required String nickname,
    required String bio,
    required String profileImageUrl,
    required String phoneNumber,
    required List<String> fitnessGoals,
    required String fitnessLevel,
    required DateTime updatedAt,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromDto(UserProfileDto dto) {
    return UserProfileEntity(
      accountId: dto.accountId,
      nickname: dto.nickname,
      bio: dto.bio,
      profileImageUrl: dto.profileImageUrl,
      phoneNumber: dto.phoneNumber,
      fitnessGoals: dto.fitnessGoals,
      fitnessLevel: dto.fitnessLevel,
      updatedAt: dto.updatedAt,
    );
  }
}
