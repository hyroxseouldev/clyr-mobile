// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  avatarUrl: json['avatar_url'] as String?,
);

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
    };

CommunityDto _$CommunityDtoFromJson(Map<String, dynamic> json) => CommunityDto(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  imageUrl: json['image_url'] as String?,
  eventDate: DateTime.parse(json['event_date'] as String),
  location: json['location'] as String,
  maxParticipants: (json['max_participants'] as num).toInt(),
  creatorId: json['creator_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$CommunityDtoToJson(CommunityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'image_url': instance.imageUrl,
      'event_date': instance.eventDate.toIso8601String(),
      'location': instance.location,
      'max_participants': instance.maxParticipants,
      'creator_id': instance.creatorId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

CommunityParticipantDto _$CommunityParticipantDtoFromJson(
  Map<String, dynamic> json,
) => CommunityParticipantDto(
  id: json['id'] as String,
  communityId: json['community_id'] as String,
  userId: json['user_id'] as String,
  joinedAt: DateTime.parse(json['joined_at'] as String),
);

Map<String, dynamic> _$CommunityParticipantDtoToJson(
  CommunityParticipantDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'community_id': instance.communityId,
  'user_id': instance.userId,
  'joined_at': instance.joinedAt.toIso8601String(),
};

CommunityWithCreatorDto _$CommunityWithCreatorDtoFromJson(
  Map<String, dynamic> json,
) => CommunityWithCreatorDto(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  imageUrl: json['image_url'] as String?,
  eventDate: DateTime.parse(json['event_date'] as String),
  location: json['location'] as String,
  maxParticipants: (json['max_participants'] as num).toInt(),
  creatorId: json['creator_id'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  creator: json['accounts'] == null
      ? null
      : AccountDto.fromJson(json['accounts'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CommunityWithCreatorDtoToJson(
  CommunityWithCreatorDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'image_url': instance.imageUrl,
  'event_date': instance.eventDate.toIso8601String(),
  'location': instance.location,
  'max_participants': instance.maxParticipants,
  'creator_id': instance.creatorId,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'accounts': instance.creator,
};
