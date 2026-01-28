// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionRecordWithUserProfileDto _$SectionRecordWithUserProfileDtoFromJson(
  Map<String, dynamic> json,
) => SectionRecordWithUserProfileDto(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  userProfileId: json['user_profile_id'] as String?,
  sectionId: json['section_id'] as String,
  sectionItemId: json['section_item_id'] as String,
  content: json['content'] as Map<String, dynamic>?,
  completedAt: DateTime.parse(json['completed_at'] as String),
  coachComment: json['coach_comment'] as String?,
  nickname: json['nickname'] as String?,
  profileImageUrl: json['profile_image_url'] as String?,
);

Map<String, dynamic> _$SectionRecordWithUserProfileDtoToJson(
  SectionRecordWithUserProfileDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'user_profile_id': instance.userProfileId,
  'section_id': instance.sectionId,
  'section_item_id': instance.sectionItemId,
  'content': instance.content,
  'completed_at': instance.completedAt.toIso8601String(),
  'coach_comment': instance.coachComment,
  'nickname': instance.nickname,
  'profile_image_url': instance.profileImageUrl,
};

LeaderboardDto _$LeaderboardDtoFromJson(Map<String, dynamic> json) =>
    LeaderboardDto(
      sectionRecords: (json['sectionRecords'] as List<dynamic>)
          .map(
            (e) => SectionRecordWithUserProfileDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
      mySectionRecordId: json['mySectionRecordId'] as String?,
      sectionItemContent: json['sectionItemContent'] as String?,
    );

Map<String, dynamic> _$LeaderboardDtoToJson(LeaderboardDto instance) =>
    <String, dynamic>{
      'sectionRecords': instance.sectionRecords.map((e) => e.toJson()).toList(),
      'mySectionRecordId': instance.mySectionRecordId,
      'sectionItemContent': instance.sectionItemContent,
    };
