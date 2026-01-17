import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_program_info_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/program_list_card.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutView extends ConsumerWidget {
  const WorkoutView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final programState = ref.watch(getProgramInfoControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workout')),
      body: AsyncWidget<PaginatedData<ProgramEntity>>(
        data: programState,
        builder: (data) {
          return PaginatedListView<ProgramEntity>(
            items: data.items,
            hasMore: data.hasMore,
            isLoading: data.isLoading,
            error: data.error,
            onRefresh: () async {
              await ref
                  .read(getProgramInfoControllerProvider.notifier)
                  .refresh();
            },
            onLoadMore: () {
              ref.read(getProgramInfoControllerProvider.notifier).loadNext();
            },
            itemBuilder: (context, program, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ProgramListCard(program: program),
              );
            },
            separatorBuilder: (context, index) => const SizedBox.shrink(),
            emptyWidget: _buildNoEnrollmentPrompt(context),
          );
        },
      ),
    );
  }

  /// 구매한 프로그램 없음 프롬프트
  Widget _buildNoEnrollmentPrompt(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: Colors.orange.shade300,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.noEnrollment,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.noEnrollmentDesc,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
