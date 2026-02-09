import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/create_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/delete_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/get_community_detail_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/get_communities_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/join_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/leave_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/update_community_usecase.dart';

part 'community_usecase_provider.g.dart';

/// Provides GetCommunitiesUseCase
@Riverpod(keepAlive: true)
GetCommunitiesUseCase getCommunitiesUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return GetCommunitiesUseCase(communityRepository: repository);
}

/// Provides GetCommunityDetailUseCase
@Riverpod(keepAlive: true)
GetCommunityDetailUseCase getCommunityDetailUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return GetCommunityDetailUseCase(communityRepository: repository);
}

/// Provides CreateCommunityUseCase
@Riverpod(keepAlive: true)
CreateCommunityUseCase createCommunityUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return CreateCommunityUseCase(communityRepository: repository);
}

/// Provides UpdateCommunityUseCase
@Riverpod(keepAlive: true)
UpdateCommunityUseCase updateCommunityUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return UpdateCommunityUseCase(communityRepository: repository);
}

/// Provides DeleteCommunityUseCase
@Riverpod(keepAlive: true)
DeleteCommunityUseCase deleteCommunityUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return DeleteCommunityUseCase(communityRepository: repository);
}

/// Provides JoinCommunityUseCase
@Riverpod(keepAlive: true)
JoinCommunityUseCase joinCommunityUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return JoinCommunityUseCase(communityRepository: repository);
}

/// Provides LeaveCommunityUseCase
@Riverpod(keepAlive: true)
LeaveCommunityUseCase leaveCommunityUseCase(Ref ref) {
  final repository = ref.watch(communityRepositoryProvider);
  return LeaveCommunityUseCase(communityRepository: repository);
}
