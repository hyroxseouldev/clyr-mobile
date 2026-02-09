import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:clyr_mobile/src/feature/community/data/dto/community_dto.dart';
import 'package:clyr_mobile/src/feature/community/data/data_source/community_data_source.dart';

/// Supabase implementation of CommunityDataSource
class CommunityDataSourceImpl implements CommunityDataSource {
  final SupabaseClient _supabase;

  CommunityDataSourceImpl(this._supabase);

  @override
  Future<CommunityDto> createCommunity({
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    required int maxParticipants,
  }) async {
    final userId = _supabase.auth.currentUser?.id;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    final response = await _supabase
        .from('communities')
        .insert({
          'title': title,
          'content': content,
          'image_url': imageUrl,
          'event_date': eventDate.toIso8601String(),
          'location': location,
          'max_participants': maxParticipants,
          'creator_id': userId,
        })
        .select()
        .single();

    return CommunityDto.fromJson(response);
  }

  @override
  Future<List<CommunityWithCreatorDto>> getCommunities({
    int? limit,
    int? offset,
    DateTime? startDate,
    DateTime? endDate,
    String? location,
  }) async {
    // Start query builder with select first
    // communities → account → user_profile nested join
    dynamic query = _supabase.from('communities').select('''
          id,
          title,
          content,
          image_url,
          event_date,
          location,
          max_participants,
          creator_id,
          created_at,
          updated_at,
          account (
            id,
            user_profile (
              id,
              nickname,
              profile_image_url
            )
          )
        ''');

    // Apply filters after select (now we have PostgrestFilterBuilder)
    if (startDate != null) {
      query = query.gte('event_date', startDate.toIso8601String());
    }
    if (endDate != null) {
      query = query.lte('event_date', endDate.toIso8601String());
    }
    if (location != null) {
      query = query.ilike('location', '%$location%');
    }

    // Apply ordering and pagination (order returns PostgrestTransformBuilder)
    query = query.order('event_date', ascending: true);
    if (limit != null) query = query.limit(limit);
    if (offset != null) query = query.range(offset, offset + limit! - 1);

    final response = await query;

    // Fetch participant counts for all communities
    final communityIds = response.map((e) => e['id'] as String).toList();

    final counts = await _getParticipantCounts(communityIds);

    return response.map<CommunityWithCreatorDto>((json) {
      final dto = CommunityWithCreatorDto.fromJson(json);
      dto.participantCount = counts[json['id'] as String] ?? 0;
      return dto;
    }).toList();
  }

  /// Batch fetch participant counts for multiple communities
  Future<Map<String, int>> _getParticipantCounts(
    List<dynamic> communityIds,
  ) async {
    if (communityIds.isEmpty) return {};

    debugPrint(
      '💬 [CommunityDataSource] Fetching participant counts for ${communityIds.length} communities',
    );

    final response = await _supabase
        .from('community_participants')
        .select('community_id')
        .inFilter('community_id', communityIds);

    debugPrint('💬 [CommunityDataSource] Raw response: $response');
    debugPrint(
      '💬 [CommunityDataSource] Response type: ${response.runtimeType}',
    );

    final counts = <String, int>{};
    for (final row in response) {
      debugPrint(
        '💬 [CommunityDataSource] Processing row: $row (type: ${row.runtimeType})',
      );
      final id = row['community_id']?.toString();
      debugPrint('💬 [CommunityDataSource] Extracted ID: $id');
      if (id != null) {
        counts[id] = (counts[id] ?? 0) + 1;
      }
    }

    debugPrint('✅ [CommunityDataSource] Participant counts: $counts');
    return counts;
  }

  @override
  Future<CommunityWithCreatorDto> getCommunityById(String id) async {
    final response = await _supabase
        .from('communities')
        .select('''
          id,
          title,
          content,
          image_url,
          event_date,
          location,
          max_participants,
          creator_id,
          created_at,
          updated_at,
          account (
            id,
            user_profile (
              id,
              nickname,
              profile_image_url
            )
          )
        ''')
        .eq('id', id)
        .single();

    final dto = CommunityWithCreatorDto.fromJson(response);
    dto.participantCount = await getCommunityParticipantCount(id);
    return dto;
  }

  @override
  Future<List<CommunityParticipantDto>> getCommunityParticipants(
    String communityId,
  ) async {
    final response = await _supabase
        .from('community_participants')
        .select()
        .eq('community_id', communityId);

    return response
        .map((json) => CommunityParticipantDto.fromJson(json))
        .toList();
  }

  @override
  Future<void> updateCommunity({
    required String id,
    String? title,
    String? content,
    String? imageUrl,
    DateTime? eventDate,
    String? location,
    int? maxParticipants,
  }) async {
    final data = <String, dynamic>{};
    if (title != null) data['title'] = title;
    if (content != null) data['content'] = content;
    if (imageUrl != null) data['image_url'] = imageUrl;
    if (eventDate != null) data['event_date'] = eventDate.toIso8601String();
    if (location != null) data['location'] = location;
    if (maxParticipants != null) data['max_participants'] = maxParticipants;
    data['updated_at'] = DateTime.now().toIso8601String();

    await _supabase.from('communities').update(data).eq('id', id);
  }

  @override
  Future<void> deleteCommunity(String id) async {
    debugPrint('💬 [CommunityDataSource] Attempting to delete community: $id');

    final userId = _supabase.auth.currentUser?.id;
    debugPrint('💬 [CommunityDataSource] Current user ID: $userId');

    try {
      final result = await _supabase
          .from('communities')
          .delete()
          .eq('id', id)
          .select();

      debugPrint('✅ [CommunityDataSource] Delete result: $result');
    } catch (e) {
      debugPrint('❌ [CommunityDataSource] Delete error: $e');
      rethrow;
    }
  }

  @override
  Future<void> joinCommunity({
    required String communityId,
    required String userId,
  }) async {
    final isMember = await isUserMemberOfCommunity(
      communityId: communityId,
      userId: userId,
    );

    if (isMember) {
      throw Exception('User is already a member');
    }

    final count = await getCommunityParticipantCount(communityId);
    final community = await getCommunityById(communityId);

    if (count >= community.maxParticipants) {
      throw Exception('Community is full');
    }

    await _supabase.from('community_participants').insert({
      'community_id': communityId,
      'user_id': userId,
      'joined_at': DateTime.now().toIso8601String(),
    });
  }

  @override
  Future<void> leaveCommunity({
    required String communityId,
    required String userId,
  }) async {
    await _supabase
        .from('community_participants')
        .delete()
        .eq('community_id', communityId)
        .eq('user_id', userId);
  }

  @override
  Future<bool> isUserMemberOfCommunity({
    required String communityId,
    required String userId,
  }) async {
    final response = await _supabase
        .from('community_participants')
        .select()
        .eq('community_id', communityId)
        .eq('user_id', userId)
        .maybeSingle();

    return response != null;
  }

  @override
  Future<int> getCommunityParticipantCount(String communityId) async {
    final response = await _supabase
        .from('community_participants')
        .select()
        .eq('community_id', communityId);

    return response.length;
  }
}
