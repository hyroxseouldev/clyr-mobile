import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/provider/enrollments_controller.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/widget/enrollment_card.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MembershipView extends ConsumerWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final enrollmentsState = ref.watch(enrollmentsControllerProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsMembership)),
      body: AsyncWidget<PaginatedData<EnrollmentEntity>>(
        data: enrollmentsState,
        builder: (data) {
          return PaginatedListView<EnrollmentEntity>(
            items: data.items,
            hasMore: data.hasMore,
            isLoading: data.isLoading,
            onLoadMore: () =>
                ref.read(enrollmentsControllerProvider.notifier).loadNext(),
            onRefresh: () =>
                ref.read(enrollmentsControllerProvider.notifier).refresh(),
            padding: const EdgeInsets.all(16),
            emptyWidget: _buildEmptyWidget(context),
            itemBuilder: (context, enrollment, index) =>
                EnrollmentCard.fromEntity(enrollment),
          );
        },
      ),
    );
  }

  Widget _buildEmptyWidget(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.card_membership_outlined,
            size: 64,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.emptyMembership,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
