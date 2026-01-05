import 'package:clyr_mobile/src/feature/auth/data/user_profile_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';

/// 사용자 프로필 엔티티
@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const UserProfileEntity._();

  const factory UserProfileEntity({
    String? id,
    required String accountId,
    String? nickname,
    String? bio,
    String? profileImageUrl,
    String? phoneNumber,
    @Default([]) List<String> fitnessGoals,
    FitnessLevel? fitnessLevel,
    DateTime? updatedAt,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromDto(UserProfileDto dto) {
    return UserProfileEntity(
      id: dto.id,
      accountId: dto.accountId ?? '',
      nickname: dto.nickname,
      bio: dto.bio,
      profileImageUrl: dto.profileImageUrl,
      phoneNumber: dto.phoneNumber,
      fitnessGoals: dto.fitnessGoals ?? [],
      fitnessLevel: dto.fitnessLevel != null
          ? FitnessLevel.values.firstWhere(
              (e) => e.name.toLowerCase() == dto.fitnessLevel!.toLowerCase(),
              orElse: () => FitnessLevel.beginner,
            )
          : null,
      updatedAt: dto.updatedAt,
    );
  }
}

/// 운동 수준 enum
enum FitnessLevel {
  beginner,
  intermediate,
  advanced;

  String get displayName {
    switch (this) {
      case FitnessLevel.beginner:
        return '초급자';
      case FitnessLevel.intermediate:
        return '중급자';
      case FitnessLevel.advanced:
        return '고급자';
    }
  }
}
