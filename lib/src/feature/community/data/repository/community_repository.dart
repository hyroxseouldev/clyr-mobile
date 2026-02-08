import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';

/// Community repository interface
/// Defines CRUD operations for community posts and participants
abstract class CommunityRepository {
  /// Create a new community post
  FutureEither<CommunityEntity> createCommunity({
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    int maxParticipants,
  });

  /// Fetch list of communities with optional filters
  FutureEither<List<CommunityEntity>> getCommunities({
    int? limit,
    int? offset,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  });

  /// Fetch single community by ID
  FutureEither<CommunityEntity> getCommunityById(String id);

  /// Fetch participants for a specific community
  FutureEither<List<CommunityParticipantEntity>> getCommunityParticipants(
    String communityId,
  );

  /// Update an existing community post
  FutureEither<CommunityEntity> updateCommunity({
    required String id,
    String? title,
    String? content,
    String? imageUrl,
    DateTime? eventDate,
    String? location,
    int? maxParticipants,
  });

  /// Delete a community post
  FutureEither<void> deleteCommunity(String id);

  /// User joins a community
  FutureEither<void> joinCommunity({
    required String communityId,
    required String userId,
  });

  /// User leaves a community
  FutureEither<void> leaveCommunity({
    required String communityId,
    required String userId,
  });

  /// Check if user is a member of a community
  FutureEither<bool> isUserMemberOfCommunity({
    required String communityId,
    required String userId,
  });
}
