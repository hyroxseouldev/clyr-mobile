import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for LeaveCommunityUseCase
class LeaveCommunityParams {
  const LeaveCommunityParams({
    required this.communityId,
    required this.userId,
  });

  final String communityId;
  final String userId;
}

/// Use case for leaving a community
class LeaveCommunityUseCase {
  const LeaveCommunityUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<void> call(LeaveCommunityParams params) async {
    return _communityRepository.leaveCommunity(
      communityId: params.communityId,
      userId: params.userId,
    );
  }
}
