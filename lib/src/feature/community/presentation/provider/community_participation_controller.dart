import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart' show left, right;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/router/session_provider.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/community_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/join_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/leave_community_usecase.dart';

part 'community_participation_controller.g.dart';

/// Participation state (joined/not joined)
enum ParticipationStatus {
  notJoined,
  joined,
  loading,
  error,
}

/// Community participation controller
@riverpod
class CommunityParticipation extends _$CommunityParticipation {
  @override
  ParticipationStatus build({
    required String communityId,
    required bool isMember,
  }) {
    return isMember ? ParticipationStatus.joined : ParticipationStatus.notJoined;
  }

  /// Join community
  FutureEither<void> join() async {
    state = ParticipationStatus.loading;
    debugPrint('💬 [CommunityParticipation] Joining community: $communityId');

    final userId = _getCurrentUserId();
    if (userId == null) {
      debugPrint('❌ [CommunityParticipation] No user logged in');
      state = ParticipationStatus.error;
      return left(AppException.auth('No user logged in'));
    }

    final usecase = ref.read(joinCommunityUseCaseProvider);
    final params = JoinCommunityParams(
      communityId: communityId,
      userId: userId,
    );

    final result = await usecase(params);

    return result.fold(
      (error) {
        debugPrint('❌ [CommunityParticipation] Failed to join: ${error.message}');
        state = ParticipationStatus.error;
        return left(error);
      },
      (_) {
        debugPrint('✅ [CommunityParticipation] Successfully joined community');
        state = ParticipationStatus.joined;
        return right(null);
      },
    );
  }

  /// Leave community
  FutureEither<void> leave() async {
    state = ParticipationStatus.loading;
    debugPrint('💬 [CommunityParticipation] Leaving community: $communityId');

    final userId = _getCurrentUserId();
    if (userId == null) {
      debugPrint('❌ [CommunityParticipation] No user logged in');
      state = ParticipationStatus.error;
      return left(AppException.auth('No user logged in'));
    }

    final usecase = ref.read(leaveCommunityUseCaseProvider);
    final params = LeaveCommunityParams(
      communityId: communityId,
      userId: userId,
    );

    final result = await usecase(params);

    return result.fold(
      (error) {
        debugPrint('❌ [CommunityParticipation] Failed to leave: ${error.message}');
        state = ParticipationStatus.error;
        return left(error);
      },
      (_) {
        debugPrint('✅ [CommunityParticipation] Successfully left community');
        state = ParticipationStatus.notJoined;
        return right(null);
      },
    );
  }

  /// Get current user ID from auth
  String? _getCurrentUserId() {
    final sessionState = ref.read(sessionProvider);
    return sessionState.value?.id;
  }
}
