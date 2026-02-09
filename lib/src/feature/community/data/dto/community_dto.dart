import 'package:json_annotation/json_annotation.dart';

part 'community_dto.g.dart';

/// Converter to extract user_profile from nested account structure
/// Handles: communities → account → user_profile
class NestedUserProfileConverter implements JsonConverter<UserProfileDto?, dynamic> {
  const NestedUserProfileConverter();

  @override
  UserProfileDto? fromJson(dynamic json) {
    if (json == null) return null;
    // Handle empty list case
    if (json is List && json.isEmpty) return null;

    // Handle nested structure: account → user_profile
    if (json is Map) {
      final map = Map<String, dynamic>.from(json);

      // Direct user_profile (if querying user_profile directly)
      if (map.containsKey('nickname')) {
        return UserProfileDto.fromJson(map);
      }

      // Nested in account: account → user_profile
      if (map.containsKey('user_profile')) {
        final userProfile = map['user_profile'];
        if (userProfile == null) return null;
        if (userProfile is List && userProfile.isEmpty) return null;
        if (userProfile is Map) {
          return UserProfileDto.fromJson(Map<String, dynamic>.from(userProfile));
        }
      }
    }
    return null;
  }

  @override
  dynamic toJson(UserProfileDto? object) => object?.toJson();
}

/// Minimal user profile DTO for creator profile
/// Feature-scoped to avoid dependency on core layer
@JsonSerializable()
class UserProfileDto {
  final String id;
  @JsonKey(name: 'nickname')
  final String nickname;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;

  UserProfileDto({
    required this.id,
    required this.nickname,
    this.profileImageUrl,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
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

  /// Nested creator profile from account → user_profiles
  @NestedUserProfileConverter()
  @JsonKey(name: 'account')
  final UserProfileDto? creator;

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
