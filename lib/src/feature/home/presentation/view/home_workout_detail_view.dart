import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_detail_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/workout_detail_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/health_detail_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/not_found_widget.dart';

class HomeWorkoutDetailView extends ConsumerWidget {
  const HomeWorkoutDetailView({super.key, required this.workoutId});
  static const routeName = 'home_workout_detail';
  final String workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final workoutState = ref.watch(workoutDetailProvider(workoutId));

    return Scaffold(
      appBar: AppBar(),
      body: AsyncWidget<HealthWorkoutData?>(
        data: workoutState,
        builder: (workout) {
          if (workout == null) {
            return NotFoundWidget(message: l10n.workoutNotFound);
          }

          return SingleChildScrollView(
            child: Column(
              children: [
                HealthDetailWidget(
                  workout: workout,
                  timeText: l10n.duration,
                  avgHeartRateText: l10n.avgHeartRate,
                  caloriesText: l10n.calories,
                  maxHeartRateText: l10n.maxHeartRate,
                ),
                WorkoutDetailWidget(
                  workout: workout,
                  workoutTypeText: l10n.workoutType,
                  durationText: l10n.duration,
                  startTimeText: l10n.startTime,
                  endTimeText: l10n.endTime,
                  avgHeartRateText: l10n.avgHeartRate,
                  distanceText: l10n.distance,
                  caloriesText: l10n.calories,
                  metadataText: l10n.metadata,
                  notAvailableText: l10n.notAvailable,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
