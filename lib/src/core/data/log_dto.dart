import 'package:json_annotation/json_annotation.dart';

part 'log_dto.g.dart';

/// Flattened DTO for section records with user profile data
/// Avoids nested JSON parsing errors from Supabase queries
@JsonSerializable()
class SectionRecordWithUserProfileDto {
  // Section record fields
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'user_profile_id')
  final String? userProfileId;
  @JsonKey(name: 'section_id')
  final String sectionId;
  @JsonKey(name: 'section_item_id')
  final String sectionItemId;
  @JsonKey(name: 'content')
  final Map<String, dynamic>? content;
  @JsonKey(name: 'completed_at')
  final DateTime completedAt;
  @JsonKey(name: 'coach_comment')
  final String? coachComment;

  // User profile fields (flattened from nested user_profile)
  @JsonKey(name: 'nickname')
  final String? nickname;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;

  SectionRecordWithUserProfileDto({
    required this.id,
    required this.userId,
    this.userProfileId,
    required this.sectionId,
    required this.sectionItemId,
    this.content,
    required this.completedAt,
    this.coachComment,
    this.nickname,
    this.profileImageUrl,
  });

  factory SectionRecordWithUserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$SectionRecordWithUserProfileDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SectionRecordWithUserProfileDtoToJson(this);
}

/// Leaderboard data with all records, current user's record ID, and section content
@JsonSerializable(explicitToJson: true)
class LeaderboardDto {
  final List<SectionRecordWithUserProfileDto> sectionRecords;
  final String? mySectionRecordId;
  final String?
  sectionItemContent; // Content from blueprint_section linked by sectionId

  LeaderboardDto({
    required this.sectionRecords,
    this.mySectionRecordId,
    this.sectionItemContent,
  });

  factory LeaderboardDto.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LeaderboardDtoToJson(this);
}
