import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_workout_entity.dart';
import 'package:flutter/material.dart';

/// Home workout feed card widget
/// Displays workout information with different layouts for running and fitness activities
class HomeWorkoutFeedCardWidget extends StatelessWidget {
  const HomeWorkoutFeedCardWidget({
    super.key,
    required this.workout,
    this.onTap,
  });

  final HealthWorkoutData workout;
  final VoidCallback? onTap;

  factory HomeWorkoutFeedCardWidget.fromEntity(
    HealthWorkoutData workout, {
    VoidCallback? onTap,
  }) {
    return HomeWorkoutFeedCardWidget(workout: workout, onTap: onTap);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Workout At Time
              // TODO: Icon + Time Row
              Text(workout.startTime.toLocal().toString()),
              const SizedBox(height: 12),
              if (workout.isRunningActivity) _buildRunningLayout(theme),
              if (!workout.isRunningActivity) _buildFitnessLayout(theme),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.ios_share),
                    visualDensity: VisualDensity.compact,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRunningLayout(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workout.workoutNameWithTime,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _buildStatItem(
              theme,
              label: 'Time',
              value: workout.formattedDuration,
            ),
            const SizedBox(width: 24),
            _buildStatItem(
              theme,
              label: 'Pace',
              value: workout.formattedPace ?? '-',
            ),
            const SizedBox(width: 24),
            _buildStatItem(
              theme,
              label: 'Distance',
              value: workout.formattedDistance,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildFitnessLayout(ThemeData theme) {
    final avgHr = workout.avgHeartRate;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workout.workoutType.displayName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          workout.formattedDuration,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildStatItem(theme, label: 'Avg HR', value: '$avgHr bpm'),
            const SizedBox(width: 24),
            _buildStatItem(
              theme,
              label: 'Cal',
              value: workout.formattedCalories,
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildStatItem(
    ThemeData theme, {
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
