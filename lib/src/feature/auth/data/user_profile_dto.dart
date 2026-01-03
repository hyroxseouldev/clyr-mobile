import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';

part 'user_profile_dto.g.dart';

@JsonSerializable()
class UserProfileDto {
  // 주석을 보고 만들어
  final String accountId;
  final String nickname;
  final String bio;
  final String profileImageUrl;
  final String phoneNumber;
  final List<String> fitnessGoals;
  final String fitnessLevel;
  final DateTime updatedAt;

  UserProfileDto({
    required this.accountId,
    required this.nickname,
    required this.bio,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.fitnessGoals,
    required this.fitnessLevel,
    required this.updatedAt,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  UserProfileEntity toEntity() => UserProfileEntity.fromDto(this);
}
