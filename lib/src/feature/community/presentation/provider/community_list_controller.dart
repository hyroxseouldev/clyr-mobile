import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/community_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/get_communities_usecase.dart';

part 'community_list_controller.g.dart';

/// Community list state
@riverpod
class CommunityList extends _$CommunityList {
  @override
  Future<List<CommunityEntity>> build() async {
    final usecase = ref.watch(getCommunitiesUseCaseProvider);
    final params = const GetCommunitiesParams();
    final result = await usecase(params);
    return result.fold(
      (error) => throw error,
      (communities) => communities,
    );
  }

  /// Refresh the community list
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final usecase = ref.watch(getCommunitiesUseCaseProvider);
    final params = const GetCommunitiesParams();
    final result = await usecase(params);
    state = result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (communities) => AsyncValue.data(communities),
    );
  }
}
