import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/community_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/get_community_detail_usecase.dart';

part 'community_detail_controller.g.dart';

/// Community detail state
@riverpod
class CommunityDetail extends _$CommunityDetail {
  @override
  Future<CommunityEntity?> build(String communityId) async {
    final usecase = ref.watch(getCommunityDetailUseCaseProvider);
    final params = GetCommunityDetailParams(id: communityId);
    final result = await usecase(params);
    return result.fold(
      (error) => throw error,
      (community) => community,
    );
  }

  /// Refresh the community detail
  Future<void> refresh() async {
    final communityId = state.value?.id ?? '';
    if (communityId.isEmpty) return;

    state = const AsyncValue.loading();
    final usecase = ref.watch(getCommunityDetailUseCaseProvider);
    final params = GetCommunityDetailParams(id: communityId);
    final result = await usecase(params);
    state = result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (community) => AsyncValue.data(community),
    );
  }
}
