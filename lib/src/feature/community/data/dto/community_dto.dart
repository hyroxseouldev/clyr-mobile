import 'package:json_annotation/json_annotation.dart';

part 'community_dto.g.dart';

/// Minimal account DTO for creator profile
/// Feature-scoped to avoid dependency on core layer
@JsonSerializable()
class AccountDto {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  AccountDto({
    required this.id,
    required this.fullName,
    this.avatarUrl,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}

/// Community post data transfer object
@JsonSerializable()
class CommunityDto {
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'event_date')
  final DateTime eventDate;
  @JsonKey(name: 'location')
  final String location;
  @JsonKey(name: 'max_participants')
  final int maxParticipants;
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  CommunityDto({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.eventDate,
    required this.location,
    required this.maxParticipants,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CommunityDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityDtoToJson(this);
}

/// Community participant data transfer object
@JsonSerializable()
class CommunityParticipantDto {
  final String id;
  @JsonKey(name: 'community_id')
  final String communityId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'joined_at')
  final DateTime joinedAt;

  CommunityParticipantDto({
    required this.id,
    required this.communityId,
    required this.userId,
    required this.joinedAt,
  });

  factory CommunityParticipantDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityParticipantDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityParticipantDtoToJson(this);
}

/// Community with nested creator profile
/// Used for Supabase queries that fetch creator data in single request
@JsonSerializable()
class CommunityWithCreatorDto {
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @JsonKey(name: 'event_date')
  final DateTime eventDate;
  @JsonKey(name: 'location')
  final String location;
  @JsonKey(name: 'max_participants')
  final int maxParticipants;
  @JsonKey(name: 'creator_id')
  final String creatorId;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Nested creator profile from accounts table
  @JsonKey(name: 'accounts')
  final AccountDto? creator;

  /// Computed field - not included in JSON serialization
  @JsonKey(includeFromJson: false, includeToJson: false)
  int? participantCount;

  CommunityWithCreatorDto({
    required this.id,
    required this.title,
    required this.content,
    this.imageUrl,
    required this.eventDate,
    required this.location,
    required this.maxParticipants,
    required this.creatorId,
    required this.createdAt,
    required this.updatedAt,
    this.creator,
    this.participantCount,
  });

  factory CommunityWithCreatorDto.fromJson(Map<String, dynamic> json) =>
      _$CommunityWithCreatorDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CommunityWithCreatorDtoToJson(this);
}
