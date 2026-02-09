import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for GetCommunitiesUseCase
class GetCommunitiesParams {
  const GetCommunitiesParams({
    this.limit,
    this.offset,
    this.startDate,
    this.endDate,
    this.location,
  });

  final int? limit;
  final int? offset;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? location;
}

/// Use case for getting community list
class GetCommunitiesUseCase {
  const GetCommunitiesUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<List<CommunityEntity>> call(GetCommunitiesParams params) async {
    return _communityRepository.getCommunities(
      limit: params.limit,
      offset: params.offset,
      startDate: params.startDate,
      endDate: params.endDate,
      location: params.location,
    );
  }
}
