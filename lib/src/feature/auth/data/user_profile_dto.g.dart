// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      accountId: json['accountId'] as String,
      nickname: json['nickname'] as String,
      bio: json['bio'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      phoneNumber: json['phoneNumber'] as String,
      fitnessGoals: (json['fitnessGoals'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      fitnessLevel: json['fitnessLevel'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UserProfileDtoToJson(UserProfileDto instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'nickname': instance.nickname,
      'bio': instance.bio,
      'profileImageUrl': instance.profileImageUrl,
      'phoneNumber': instance.phoneNumber,
      'fitnessGoals': instance.fitnessGoals,
      'fitnessLevel': instance.fitnessLevel,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
