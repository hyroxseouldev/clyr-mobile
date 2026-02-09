import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_list_controller.dart';
import 'package:clyr_mobile/src/feature/community/presentation/view/community_create_view.dart';
import 'package:clyr_mobile/src/feature/community/presentation/view/community_detail_view.dart';
import 'package:clyr_mobile/src/feature/community/presentation/widget/community_list_card.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';

/// Community list view - displays all communities
class CommunityListView extends ConsumerWidget {
  const CommunityListView({super.key});
  static const routeName = 'community_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final communitiesState = ref.watch(communityListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.communityTitle),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(CommunityCreateView.routeName),
        tooltip: l10n.communityCreate,
        child: const Icon(Icons.add),
      ),
      body: AsyncWidget<List<CommunityEntity>>(
        data: communitiesState,
        builder: (communities) {
          if (communities.isEmpty) {
            return EmptyState(
              text: l10n.emptyCommunity,
              icon: const Icon(Icons.groups_outlined),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(communityListProvider.notifier).refresh(),
            child: ListView.builder(
              itemCount: communities.length,
              itemBuilder: (context, index) {
                final community = communities[index];
                return CommunityListCard(
                  community: community,
                  onTap: () => context.goNamed(
                    CommunityDetailView.routeName,
                    pathParameters: {'id': community.id},
                  ),
                  participantsText: 'Participants', // TODO: add proper l10n key
                  fullText: l10n.communityFull,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
