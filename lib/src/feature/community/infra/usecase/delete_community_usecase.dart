import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for DeleteCommunityUseCase
class DeleteCommunityParams {
  const DeleteCommunityParams({required this.id});

  final String id;
}

/// Use case for deleting a community
class DeleteCommunityUseCase {
  const DeleteCommunityUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<void> call(DeleteCommunityParams params) async {
    return _communityRepository.deleteCommunity(params.id);
  }
}
