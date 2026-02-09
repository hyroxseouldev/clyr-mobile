import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for GetCommunityDetailUseCase
class GetCommunityDetailParams {
  const GetCommunityDetailParams({required this.id});

  final String id;
}

/// Use case for getting single community by ID
class GetCommunityDetailUseCase {
  const GetCommunityDetailUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<CommunityEntity> call(GetCommunityDetailParams params) async {
    return _communityRepository.getCommunityById(params.id);
  }
}
