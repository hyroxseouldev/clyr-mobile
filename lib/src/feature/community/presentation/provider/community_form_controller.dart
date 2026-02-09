import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/community_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/create_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/get_community_detail_usecase.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/update_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_list_controller.dart';

part 'community_form_controller.g.dart';

/// Community form state for creating/editing
@riverpod
class CommunityForm extends _$CommunityForm {
  @override
  Future<CommunityEntity?> build({String? communityId}) async {
    // If editing, fetch existing community
    if (communityId != null && communityId.isNotEmpty) {
      final usecase = ref.watch(getCommunityDetailUseCaseProvider);
      final result = await usecase.call(GetCommunityDetailParams(id: communityId));
      return result.fold(
        (error) => throw error,
        (community) => community,
      );
    }
    return null;
  }

  /// Submit form - create or update
  Future<CommunityEntity?> submit({
    required String title,
    required String content,
    String? imageUrl,
    required DateTime eventDate,
    required String location,
    required int maxParticipants,
    required Function() onSuccess,
  }) async {
    state = const AsyncValue.loading();

    // Check if editing or creating
    final existingCommunity = state.value;
    final isEditing = existingCommunity != null;

    final result = isEditing
        ? await ref.read(updateCommunityUseCaseProvider)(
            UpdateCommunityParams(
              id: existingCommunity.id,
              title: title,
              content: content,
              imageUrl: imageUrl,
              eventDate: eventDate,
              location: location,
              maxParticipants: maxParticipants,
            ),
          )
        : await ref.read(createCommunityUseCaseProvider)(
            CreateCommunityParams(
              title: title,
              content: content,
              imageUrl: imageUrl,
              eventDate: eventDate,
              location: location,
              maxParticipants: maxParticipants,
            ),
          );

    return result.fold(
      (error) {
        state = AsyncValue.error(error, StackTrace.current);
        throw error;
      },
      (community) {
        state = AsyncValue.data(community);
        onSuccess();
        ref.invalidate(communityListProvider);
        return community;
      },
    );
  }
}
