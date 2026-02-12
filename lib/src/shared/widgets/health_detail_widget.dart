import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/shared/widgets/workout_share_button.dart';
import 'package:flutter/material.dart';

class HealthDetailWidget extends StatelessWidget {
  const HealthDetailWidget({
    super.key,
    required this.workout,
    required this.timeText,
    required this.avgHeartRateText,
    required this.caloriesText,
    required this.maxHeartRateText,
    this.onTapShare,
  });

  final HealthWorkoutData workout;
  final String timeText;
  final String avgHeartRateText;
  final String caloriesText;
  final String maxHeartRateText;
  final VoidCallback? onTapShare;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(theme, l10n),
          const SizedBox(height: 12),
          _buildWorkoutName(theme),

          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: _buildStatsGrid(theme),
          ),
          _buildShareButton(theme),
        ],
      ),
    );
  }

  Widget _buildHeader(ThemeData theme, AppLocalizations l10n) {
    return Row(
      children: [
        Icon(workout.workoutIcon, size: 20, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          workout.formattedWorkoutDate(l10n.localeName, l10n.today),
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildWorkoutName(ThemeData theme) {
    return Text(
      workout.workoutNameWithTime,
      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildStatsGrid(ThemeData theme) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 3,
      children: [
        _buildStatItem(theme, label: 'Time', value: workout.formattedDuration),
        _buildStatItem(
          theme,
          label: 'Avg Heart Rate',
          value: workout.formattedAvgHeartRate,
        ),
        _buildStatItem(
          theme,
          label: 'Calories',
          value: workout.formattedCalories,
        ),
        _buildStatItem(
          theme,
          label: 'Max Heart Rate',
          value: '${workout.maxHeartRate} bpm',
        ),
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

  Widget _buildShareButton(ThemeData theme) {
    return Align(
      alignment: Alignment.topRight,
      child: WorkoutShareButton(workout: workout),
    );
  }
}
