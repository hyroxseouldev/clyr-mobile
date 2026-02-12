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
        return 'Other';
    }
  }
}
