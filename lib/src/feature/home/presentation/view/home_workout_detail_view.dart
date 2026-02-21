import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_detail_provider.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/health_detail_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/heart_rate_chart_widget.dart';
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HealthDetailWidget(
                  workout: workout,
                  timeText: l10n.duration,
                  avgHeartRateText: l10n.avgHeartRate,
                  caloriesText: l10n.calories,
                  maxHeartRateText: l10n.maxHeartRate,
                ),
                HeartRateChartWidget(
                  heartRates: workout.heartRates,
                  averageHeartRate: workout.avgHeartRate,
                  maxHeartRate: workout.maxHeartRate,
                  duration: workout.duration,
                  totalDistance: workout.totalDistance,
                  titleText: l10n.heartRate,
                  avgHeartRateText: l10n.avgHeartRate,
                  maxHeartRateText: l10n.maxHeartRate,
                  bpmText: l10n.bpmUnit,
                  distanceUnitText: l10n.distanceUnitKm,
                  minuteUnitText: l10n.timeUnitMin,
                  emptyText: l10n.noHeartRateData,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
