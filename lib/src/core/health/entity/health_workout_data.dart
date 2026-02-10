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
    int? totalEnergyBurned, // Calories in kcal
    double? totalDistance, // Distance in meters
    List<int>? heartRates, // Heart rate data points (BPM)
    Map<String, dynamic>? metadata,
  }) = _HealthWorkoutData;

  const HealthWorkoutData._();

  /// Calculate duration from start/end times
  Duration get calculatedDuration => endTime.difference(startTime);

  /// Calculate average heart rate
  int? get avgHeartRate {
    if (heartRates == null || heartRates!.isEmpty) return null;
    return heartRates!.reduce((a, b) => a + b) ~/ heartRates!.length;
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
