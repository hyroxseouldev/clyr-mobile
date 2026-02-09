import 'package:clyr_mobile/src/feature/community/presentation/view/community_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/error/exception_localization.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/community_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/community/infra/usecase/delete_community_usecase.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_detail_controller.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_list_controller.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_participation_controller.dart';
import 'package:clyr_mobile/src/feature/community/presentation/widget/community_creator_chip.dart';
import 'package:clyr_mobile/src/feature/community/presentation/widget/community_detail_header.dart';
import 'package:clyr_mobile/src/feature/community/presentation/widget/community_detail_info.dart';
import 'package:clyr_mobile/src/feature/community/presentation/widget/community_participation_button.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';

/// Community detail view - shows full community info with join/leave
class CommunityDetailView extends ConsumerStatefulWidget {
  const CommunityDetailView({super.key, required this.communityId});
  static const routeName = 'community_detail';
  final String communityId;

  @override
  ConsumerState<CommunityDetailView> createState() =>
      _CommunityDetailViewState();
}

class _CommunityDetailViewState extends ConsumerState<CommunityDetailView> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final communityState = ref.watch(
      communityDetailProvider(widget.communityId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.communityTitle)),
      body: AsyncWidget<CommunityEntity?>(
        data: communityState,
        builder: (community) {
          if (community == null) {
            return EmptyState(
              text: l10n.communityNotFound,
              icon: const Icon(Icons.error_outline),
            );
          }

          final participationState = ref.watch(
            communityParticipationProvider(
              communityId: widget.communityId,
              isMember: community.isUserMember,
            ),
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                CommunityDetailHeader(
                  community: community,
                  onEdit: () => _navigateToEdit(context, community.id),
                  onDelete: () => _confirmDelete(context, community, l10n),
                  editText: l10n.modify,
                  deleteText: l10n.delete,
                ),
                const SizedBox(height: 16),

                // Creator info
                if (community.creator != null) ...[
                  CommunityCreatorChip(
                    creator: community.creator!,
                    createdByText: 'Created by', // TODO: add proper l10n key
                  ),
                  const SizedBox(height: 16),
                ],

                // Content
                Text(
                  community.content,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),

                // Participant info
                CommunityDetailInfo(
                  community: community,
                  participantsText: 'Participants', // TODO: add proper l10n key
                  availableText: 'Available', // TODO: add proper l10n key
                  fullText: l10n.communityFull,
                ),
                const SizedBox(height: 24),

                // Join/Leave button
                CommunityParticipationButton(
                  status: participationState,
                  isFull:
                      community.currentParticipants >=
                      community.maxParticipants,
                  isCreator: community.creatorId.isNotEmpty,
                  onJoin: () => _handleJoin(ref, l10n),
                  onLeave: () => _handleLeave(ref, l10n),
                  joinText: l10n.communityJoin,
                  leaveText: l10n.communityLeave,
                  fullText: l10n.communityFull,
                  creatorOnlyText:
                      'You are the creator', // TODO: add proper l10n key
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _handleJoin(WidgetRef ref, AppLocalizations l10n) async {
    final result = await ref
        .read(
          communityParticipationProvider(
            communityId: widget.communityId,
            isMember: false,
          ).notifier,
        )
        .join();

    result.fold(
      (error) => _showErrorSnackBar(context, error.getLocalizedMessage(l10n)),
      (_) => _refreshCommunity(ref),
    );
  }

  Future<void> _handleLeave(WidgetRef ref, AppLocalizations l10n) async {
    final result = await ref
        .read(
          communityParticipationProvider(
            communityId: widget.communityId,
            isMember: true,
          ).notifier,
        )
        .leave();

    result.fold(
      (error) => _showErrorSnackBar(context, error.getLocalizedMessage(l10n)),
      (_) => _refreshCommunity(ref),
    );
  }

  Future<void> _confirmDelete(
    BuildContext context,
    CommunityEntity community,
    AppLocalizations l10n,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.deleteConfirm),
        content: Text(l10n.deleteConfirmMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      final result = await ref.read(deleteCommunityUseCaseProvider)(
        DeleteCommunityParams(id: community.id),
      );

      result.fold(
        (error) => _showErrorSnackBar(context, error.getLocalizedMessage(l10n)),
        (_) {
          ref.invalidate(communityListProvider);
          if (context.mounted) {
            context.pop();
          }
        },
      );
    }
  }

  void _refreshCommunity(WidgetRef ref) {
    ref.read(communityDetailProvider(widget.communityId).notifier).refresh();
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _navigateToEdit(BuildContext context, String communityId) {
    context.goNamed(
      CommunityEditView.routeName,
      pathParameters: {'id': communityId},
    );
  }
}
