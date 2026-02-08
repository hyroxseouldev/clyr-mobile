import 'package:clyr_mobile/src/feature/community/data/dto/community_dto.dart';

/// Community data source interface
/// Abstracts Supabase operations for community tables
abstract class CommunityDataSource {
  /// Create a new community post
  Future<CommunityDto> createCommunity({
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    required int maxParticipants,
  });

  /// Fetch list of communities with optional filters
  Future<List<CommunityWithCreatorDto>> getCommunities({
    int? limit,
    int? offset,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  });

  /// Fetch single community by ID with creator profile
  Future<CommunityWithCreatorDto> getCommunityById(String id);

  /// Fetch participants for a specific community
  Future<List<CommunityParticipantDto>> getCommunityParticipants(String communityId);

  /// Update an existing community post
  Future<void> updateCommunity({
    required String id,
    String? title,
    String? content,
    String? imageUrl,
    DateTime? eventDate,
    String? location,
    int? maxParticipants,
  });

  /// Delete a community post
  Future<void> deleteCommunity(String id);

  /// User joins a community
  Future<void> joinCommunity({
    required String communityId,
    required String userId,
  });

  /// User leaves a community
  Future<void> leaveCommunity({
    required String communityId,
    required String userId,
  });

  /// Check if user is a member of a community
  Future<bool> isUserMemberOfCommunity({
    required String communityId,
    required String userId,
  });

  /// Get current participant count for a community
  Future<int> getCommunityParticipantCount(String communityId);
}
