import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clyr_mobile/src/feature/community/data/dto/community_dto.dart';

part 'community_entity.freezed.dart';

/// Community entity for UI consumption
@freezed
abstract class CommunityEntity with _$CommunityEntity {
  const factory CommunityEntity({
    required String id,
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    required int maxParticipants,
    required String creatorId,
    required DateTime createdAt,
    required DateTime updatedAt,
    CreatorProfileEntity? creator,
    @Default(0) int currentParticipants,
    @Default(false) bool isUserMember,
  }) = _CommunityEntity;

  factory CommunityEntity.fromDto(CommunityWithCreatorDto dto) {
    return CommunityEntity(
      id: dto.id,
      title: dto.title,
      content: dto.content,
      imageUrl: dto.imageUrl,
      eventDate: dto.eventDate,
      location: dto.location,
      maxParticipants: dto.maxParticipants,
      creatorId: dto.creatorId,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      creator: dto.creator != null
          ? CreatorProfileEntity.fromDto(dto.creator!)
          : null,
      currentParticipants: dto.participantCount ?? 0,
      isUserMember: false, // Set separately in use case
    );
  }

  factory CommunityEntity.empty() => CommunityEntity(
    id: '',
    title: '',
    content: '',
    eventDate: DateTime.now(),
    location: '',
    maxParticipants: 30,
    creatorId: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
}

/// Creator profile entity
@freezed
abstract class CreatorProfileEntity with _$CreatorProfileEntity {
  const factory CreatorProfileEntity({
    required String id,
    required String fullName,
    String? avatarUrl,
  }) = _CreatorProfileEntity;

  factory CreatorProfileEntity.fromDto(AccountDto dto) {
    return CreatorProfileEntity(
      id: dto.id,
      fullName: dto.fullName,
      avatarUrl: dto.avatarUrl,
    );
  }
}

/// Community participant entity
@freezed
abstract class CommunityParticipantEntity with _$CommunityParticipantEntity {
  const factory CommunityParticipantEntity({
    required String id,
    required String communityId,
    required String userId,
    required DateTime joinedAt,
    String? userName,
    String? userAvatarUrl,
  }) = _CommunityParticipantEntity;

  factory CommunityParticipantEntity.fromDto(
    CommunityParticipantDto dto, {
    Map<String, dynamic>? userInfo,
  }) {
    return CommunityParticipantEntity(
      id: dto.id,
      communityId: dto.communityId,
      userId: dto.userId,
      joinedAt: dto.joinedAt,
      userName: userInfo?['full_name'] as String?,
      userAvatarUrl: userInfo?['avatar_url'] as String?,
    );
  }
}
