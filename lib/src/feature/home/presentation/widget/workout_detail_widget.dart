import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';

class WorkoutDetailWidget extends StatelessWidget {
  final HealthWorkoutData workout;
  final String workoutTypeText;
  final String durationText;
  final String startTimeText;
  final String endTimeText;
  final String distanceText;
  final String caloriesText;
  final String metadataText;
  final String notAvailableText;

  const WorkoutDetailWidget({
    required this.workout,
    required this.workoutTypeText,
    required this.durationText,
    required this.startTimeText,
    required this.endTimeText,
    required this.distanceText,
    required this.caloriesText,
    required this.metadataText,
    required this.notAvailableText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWorkoutTypeHeader(theme),
          const SizedBox(height: 24),
          _buildDetailCard(context, locale, theme),
          if (workout.metadata != null && workout.metadata!.isNotEmpty) ...[
            const SizedBox(height: 16),
            _buildMetadataCard(theme),
          ],
        ],
      ),
    );
  }

  Widget _buildWorkoutTypeHeader(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          workoutTypeText,
          style: theme.textTheme.labelMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          workout.workoutType.displayName,
          style: theme.textTheme.headlineMedium,
        ),
      ],
    );
  }

  Widget _buildDetailCard(BuildContext context, Locale locale, ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDetailRow(
              context,
              Icons.access_time,
              durationText,
              _formatDuration(workout.duration),
            ),
            const Divider(height: 24),
            _buildDetailRow(
              context,
              Icons.play_arrow,
              startTimeText,
              _formatDateTime(workout.startTime, locale),
            ),
            const Divider(height: 24),
            _buildDetailRow(
              context,
              Icons.stop,
              endTimeText,
              _formatDateTime(workout.endTime, locale),
            ),
            if (workout.totalDistance != null) ...[
              const Divider(height: 24),
              _buildDetailRow(
                context,
                Icons.straighten,
                distanceText,
                _formatDistance(workout.totalDistance!, locale),
              ),
            ],
            if (workout.totalEnergyBurned != null) ...[
              const Divider(height: 24),
              _buildDetailRow(
                context,
                Icons.local_fire_department,
                caloriesText,
                _formatCalories(workout.totalEnergyBurned!, locale),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataCard(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              metadataText,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...workout.metadata!.entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${entry.key}: ',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        entry.value.toString(),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(icon, color: theme.colorScheme.primary),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: theme.textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  String _formatDateTime(DateTime dateTime, Locale locale) {
    return DateFormat.yMd(locale.languageCode).add_Hm().format(dateTime);
  }

  String _formatDistance(double distance, Locale locale) {
    // Use locale's measurement system
    final isMetric = locale.countryCode != 'US';

    if (isMetric) {
      return '${distance.toStringAsFixed(2)} km';
    } else {
      // Convert to miles for US
      final miles = distance * 0.621371;
      return '${miles.toStringAsFixed(2)} mi';
    }
  }

  String _formatCalories(int calories, Locale locale) {
    final numberFormat = NumberFormat.decimalPattern(locale.languageCode);
    return '${numberFormat.format(calories)} kcal';
  }
}
