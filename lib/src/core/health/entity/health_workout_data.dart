import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_workout_data.freezed.dart';

/// Workout data entity from health platform
@freezed
abstract class HealthWorkoutData with _$HealthWorkoutData {
  const factory HealthWorkoutData({
    required String id,
    required HealthWorkoutType workoutType,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required int totalEnergyBurned,
    required double totalDistance,
    @Default([]) List<int> heartRates,
    Map<String, dynamic>? metadata,
  }) = _HealthWorkoutData;

  const HealthWorkoutData._();

  /// Calculate duration from start/end times
  Duration get calculatedDuration => endTime.difference(startTime);

  /// Calculate average heart rate
  int get avgHeartRate {
    debugPrint('💪 [HealthWorkoutData] Heart rates: ${heartRates.join(", ")}');
    if (heartRates.isEmpty) return 0;
    return heartRates.reduce((a, b) => a + b) ~/ heartRates.length;
  }

  /// Formatted duration (e.g., "45m 30s")
  String get formattedDuration {
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

  /// Formatted start time (e.g., "14:30")
  String get formattedTime {
    return '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
  }

  /// Formatted distance in km (e.g., "6.00 km")
  String get formattedDistance {
    if (totalDistance == 0) return '-';
    final km = totalDistance / 1000;
    return '${km.toStringAsFixed(2)} km';
  }

  /// Formatted calories (e.g., "320 kcal")
  String get formattedCalories {
    if (totalEnergyBurned == 0) return '-';
    return '$totalEnergyBurned kcal';
  }

  String get formattedAvgHeartRate {
    if (heartRates.isEmpty) return '-';
    return '$avgHeartRate bpm';
  }

  /// Formatted pace (min'km) for running/walking/cycling activities
  /// Returns null if distance is zero
  String? get formattedPace {
    if (totalDistance == 0) return null;
    final paceInSecondsPerKm = duration.inSeconds / (totalDistance / 1000);
    final paceMinutes = paceInSecondsPerKm ~/ 60;
    final paceSeconds = (paceInSecondsPerKm % 60).toInt();
    return "${paceMinutes}'${paceSeconds.toString().padLeft(2, '0')}\"";
  }

  /// Check if this is a running/walking/cycling/hiking activity
  bool get isRunningActivity => switch (workoutType) {
    HealthWorkoutType.running => true,
    HealthWorkoutType.walking => true,
    HealthWorkoutType.cycling => true,
    HealthWorkoutType.hiking => true,
    _ => false,
  };

  /// Maximum heart rate in bpm
  /// Returns 0 if heart rates list is empty
  int get maxHeartRate {
    if (heartRates.isEmpty) return 0;
    return heartRates.reduce((a, b) => a > b ? a : b);
  }

  /// Workout name with time period (e.g., "Lunch Hiit", "Morning Run")
  String get workoutNameWithTime {
    final hour = startTime.hour;

    final timePeriod = switch (hour) {
      >= 0 && < 6 => 'Early Morning',
      >= 6 && < 12 => 'Morning',
      >= 12 && < 18 => 'Lunch',
      _ => 'Dinner',
    };

    return '$timePeriod ${workoutType.displayName}';
  }

  /// Icon data for the workout type
  IconData get workoutIcon => switch (workoutType) {
    HealthWorkoutType.running => Icons.directions_run,
    HealthWorkoutType.walking => Icons.directions_walk,
    HealthWorkoutType.cycling => Icons.directions_bike,
    HealthWorkoutType.swimming => Icons.pool,
    HealthWorkoutType.hiking => Icons.terrain,
    HealthWorkoutType.fitness => Icons.fitness_center,
    HealthWorkoutType.other => Icons.sports_gymnastics,
  };

  /// Formatted workout date with time
  /// If today: "{today} at {time}" (e.g., "Today at 2:30 PM")
  /// If not today: "{weekday}, {day}, {year}, at {time}" (e.g., "Mon, 12, 2026, at 2:30 PM")
  String formattedWorkoutDate(String locale, String today) {
    final now = DateTime.now();
    final isToday =
        now.year == startTime.year &&
        now.month == startTime.month &&
        now.day == startTime.day;

    final timeFormat = 'jm'; // AM/PM format
    final weekdayFormat = 'E'; // Short weekday (Mon, Tue, etc.)
    final dayFormat = 'd'; // Day of month
    final yearFormat = 'y'; // Year

    final timeStr = _formatDateWithLocale(startTime, timeFormat, locale);
    final weekdayStr = _formatDateWithLocale(startTime, weekdayFormat, locale);
    final dayStr = _formatDateWithLocale(startTime, dayFormat, locale);
    final yearStr = _formatDateWithLocale(startTime, yearFormat, locale);

    if (isToday) {
      return '$today at $timeStr';
    } else {
      return '$weekdayStr, $dayStr, $yearStr, at $timeStr';
    }
  }

  String _formatDateWithLocale(DateTime date, String pattern, String locale) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    switch (pattern) {
      case 'E':
        return weekdays[date.weekday - 1];
      case 'd':
        return date.day.toString();
      case 'y':
        return date.year.toString();
      case 'jm':
        final hour = date.hour;
        final minute = date.minute.toString().padLeft(2, '0');
        final ampm = hour >= 12 ? 'PM' : 'AM';
        final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
        return '$displayHour:$minute $ampm';
      default:
        return date.toString();
    }
  }
}

/// Supported workout types
enum HealthWorkoutType {
  running,
  walking,
  cycling,
  swimming,
  hiking,
  fitness,
  other,
}

extension WorkoutTypeExtension on HealthWorkoutType {
  String get displayName {
    switch (this) {
      case HealthWorkoutType.running:
        return 'Running';
      case HealthWorkoutType.walking:
        return 'Walking';
      case HealthWorkoutType.cycling:
        return 'Cycling';
      case HealthWorkoutType.swimming:
        return 'Swimming';
      case HealthWorkoutType.hiking:
        return 'Hiking';
      case HealthWorkoutType.fitness:
        return 'Fitness';
      case HealthWorkoutType.other:
        return 'Workout';
    }
  }
}
