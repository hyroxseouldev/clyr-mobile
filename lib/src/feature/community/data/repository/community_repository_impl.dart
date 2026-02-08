import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/data/data_source/community_data_source.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Community repository implementation
/// Handles CRUD operations with error mapping and debug logging
class CommunityRepositoryImpl implements CommunityRepository {
  final CommunityDataSource _dataSource;

  CommunityRepositoryImpl(this._dataSource);

  @override
  FutureEither<CommunityEntity> createCommunity({
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    int maxParticipants = 30,
  }) async {
    debugPrint('💬 [CommunityRepository] Creating community: $title');

    try {
      final dto = await _dataSource.createCommunity(
        title: title,
        content: content,
        imageUrl: imageUrl,
        eventDate: eventDate,
        location: location,
        maxParticipants: maxParticipants,
      );

      final fullDto = await _dataSource.getCommunityById(dto.id);
      final entity = CommunityEntity.fromDto(fullDto);

      debugPrint('✅ [CommunityRepository] Community created: ${entity.id}');
      return right(entity);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error creating community: $e');
      return left(
        AppException.community('Failed to create community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<List<CommunityEntity>> getCommunities({
    int? limit,
    int? offset,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  }) async {
    debugPrint('💬 [CommunityRepository] Fetching communities...');

    try {
      final dtos = await _dataSource.getCommunities(
        limit: limit,
        offset: offset,
        startDate: startDate,
        endDate: endDate,
        location: location,
      );

      final entities = dtos.map((dto) => CommunityEntity.fromDto(dto)).toList();

      debugPrint('✅ [CommunityRepository] Fetched ${entities.length} communities');
      return right(entities);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error fetching communities: $e');
      return left(
        AppException.community('Failed to fetch communities: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<CommunityEntity> getCommunityById(String id) async {
    debugPrint('💬 [CommunityRepository] Fetching community: $id');

    try {
      final dto = await _dataSource.getCommunityById(id);
      final entity = CommunityEntity.fromDto(dto);

      debugPrint('✅ [CommunityRepository] Community fetched: ${entity.title}');
      return right(entity);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error fetching community: $e');
      return left(
        AppException.community('Failed to fetch community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<List<CommunityParticipantEntity>> getCommunityParticipants(
    String communityId,
  ) async {
    debugPrint('💬 [CommunityRepository] Fetching participants for: $communityId');

    try {
      final dtos = await _dataSource.getCommunityParticipants(communityId);
      final entities =
          dtos.map((dto) => CommunityParticipantEntity.fromDto(dto)).toList();

      debugPrint('✅ [CommunityRepository] Fetched ${entities.length} participants');
      return right(entities);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error fetching participants: $e');
      return left(
        AppException.community('Failed to fetch participants: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<CommunityEntity> updateCommunity({
    required String id,
    String? title,
    String? content,
    String? imageUrl,
    DateTime? eventDate,
    String? location,
    int? maxParticipants,
  }) async {
    debugPrint('💬 [CommunityRepository] Updating community: $id');

    try {
      await _dataSource.updateCommunity(
        id: id,
        title: title,
        content: content,
        imageUrl: imageUrl,
        eventDate: eventDate,
        location: location,
        maxParticipants: maxParticipants,
      );

      final dto = await _dataSource.getCommunityById(id);
      final entity = CommunityEntity.fromDto(dto);

      debugPrint('✅ [CommunityRepository] Community updated: ${entity.title}');
      return right(entity);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error updating community: $e');
      return left(
        AppException.community('Failed to update community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<void> deleteCommunity(String id) async {
    debugPrint('💬 [CommunityRepository] Deleting community: $id');

    try {
      await _dataSource.deleteCommunity(id);
      debugPrint('✅ [CommunityRepository] Community deleted: $id');
      return right(null);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error deleting community: $e');
      return left(
        AppException.community('Failed to delete community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<void> joinCommunity({
    required String communityId,
    required String userId,
  }) async {
    debugPrint(
      '💬 [CommunityRepository] User $userId joining community: $communityId',
    );

    try {
      await _dataSource.joinCommunity(
        communityId: communityId,
        userId: userId,
      );
      debugPrint('✅ [CommunityRepository] User joined community successfully');
      return right(null);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error joining community: $e');
      return left(
        AppException.community('Failed to join community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<void> leaveCommunity({
    required String communityId,
    required String userId,
  }) async {
    debugPrint(
      '💬 [CommunityRepository] User $userId leaving community: $communityId',
    );

    try {
      await _dataSource.leaveCommunity(
        communityId: communityId,
        userId: userId,
      );
      debugPrint('✅ [CommunityRepository] User left community successfully');
      return right(null);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error leaving community: $e');
      return left(
        AppException.community('Failed to leave community: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<bool> isUserMemberOfCommunity({
    required String communityId,
    required String userId,
  }) async {
    try {
      final isMember = await _dataSource.isUserMemberOfCommunity(
        communityId: communityId,
        userId: userId,
      );
      return right(isMember);
    } catch (e) {
      debugPrint('❌ [CommunityRepository] Error checking membership: $e');
      return left(
        AppException.community('Failed to check membership: ${e.toString()}'),
      );
    }
  }
}
