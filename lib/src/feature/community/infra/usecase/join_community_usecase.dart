import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for JoinCommunityUseCase
class JoinCommunityParams {
  const JoinCommunityParams({
    required this.communityId,
    required this.userId,
  });

  final String communityId;
  final String userId;
}

/// Use case for joining a community
class JoinCommunityUseCase {
  const JoinCommunityUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<void> call(JoinCommunityParams params) async {
    return _communityRepository.joinCommunity(
      communityId: params.communityId,
      userId: params.userId,
    );
  }
}
