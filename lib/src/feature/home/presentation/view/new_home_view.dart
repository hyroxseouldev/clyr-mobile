import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_list_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/view/home_workout_detail_view.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/workout_list_card.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selector/date_selector_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';
import 'package:clyr_mobile/src/shared/widgets/fire_streak_badge.dart';
import 'package:clyr_mobile/src/shared/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewHomeView extends ConsumerWidget {
  const NewHomeView({super.key});
  static const String routeName = 'new_home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = ref.watch(selectedDateProvider);
    final workoutListAsync = ref.watch(workoutListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
          child: FireStreakBadge(count: 4),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await ref.read(workoutListProvider.notifier).refresh();
        },
        child: CustomScrollView(
          slivers: [
            // Date selector section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: DateSelectorWidget(
                  initialDate: selectedDate,
                  onDateSelected: (date) {
                    ref
                        .read(selectedDateProvider.notifier)
                        .setSelectedDate(date);
                  },
                ),
              ),
            ),

            // Workout list
            workoutListAsync.when(
              loading: () => const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Loader()),
              ),
              error: (error, stackTrace) => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          error.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton.icon(
                          onPressed: () async {
                            await ref
                                .read(workoutListProvider.notifier)
                                .refresh();
                          },
                          icon: const Icon(Icons.refresh),
                          label: Text(l10n.retry),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              data: (workouts) {
                if (workouts.isEmpty) {
                  return SliverFillRemaining(
                    hasScrollBody: false,
                    child: EmptyState(
                      text: l10n.noWorkoutsRecorded,
                      icon: const Icon(Icons.self_improvement),
                    ),
                  );
                }

                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final workout = workouts[index];
                    return WorkoutListCard(
                      workout: workout,
                      onTap: () {
                        context.goNamed(
                          HomeWorkoutDetailView.routeName,
                          pathParameters: {'workoutId': workout.id},
                        );
                      },
                    );
                  }, childCount: workouts.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
