import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_workout_entity.freezed.dart';

/// Home workout entity with UI-specific properties
@freezed
abstract class HomeWorkoutEntity with _$HomeWorkoutEntity {
  const factory HomeWorkoutEntity({
    required String id,
    required HealthWorkoutType workoutType,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required int totalEnergyBurned,
    required double totalDistance,
    List<int>? heartRates,
  }) = _HomeWorkoutEntity;

  const HomeWorkoutEntity._();

  /// Formatted duration (e.g., "45:30" for 45 minutes 30 seconds)
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

  /// Formatted distance in km
  String get formattedDistance {
    if (totalDistance == 0) return '-';
    final km = totalDistance / 1000;
    return '${km.toStringAsFixed(2)} km';
  }

  /// Formatted calories
  String get formattedCalories {
    if (totalEnergyBurned == 0) return '-';
    return '$totalEnergyBurned kcal';
  }

  /// Display name for workout type (localized)
  String get workoutTypeDisplayName => workoutType.displayName;

  /// Workout name with time period (e.g., "Lunch Hiit", "Morning Run")
  String get workoutNameWithTime {
    final hour = startTime.hour;

    final timePeriod = switch (hour) {
      >= 0 && < 6 => 'Early Morning',
      >= 6 && < 12 => 'Morning',
      >= 12 && < 18 => 'Lunch',
      _ => 'Dinner',
    };

    return '$timePeriod $workoutTypeDisplayName';
  }

  /// Formatted pace (min'km) for running/walking/cycling activities
  /// Returns null if distance is not available or zero
  String? get formattedPace {
    if (totalDistance == 0) return null;
    final paceInSecondsPerKm = duration.inSeconds / (totalDistance / 1000);
    final paceMinutes = paceInSecondsPerKm ~/ 60;
    final paceSeconds = (paceInSecondsPerKm % 60).toInt();
    return "${paceMinutes}'${paceSeconds.toString().padLeft(2, '0')}\"";
  }

  /// Average heart rate in bpm
  /// Returns null if heart rates data is not available
  int? get avgHeartRate {
    if (heartRates == null || heartRates!.isEmpty) return null;
    return heartRates!.reduce((a, b) => a + b) ~/ heartRates!.length;
  }
}

/// Create HomeWorkoutEntity from WorkoutData
HomeWorkoutEntity homeWorkoutEntityFromWorkoutData(HealthWorkoutData data) {
  return HomeWorkoutEntity(
    id: data.id,
    workoutType: data.workoutType,
    startTime: data.startTime,
    endTime: data.endTime,
    duration: data.duration,
    totalEnergyBurned: data.totalEnergyBurned ?? 0,
    totalDistance: data.totalDistance ?? 0.0,
    heartRates: data.heartRates,
  );
}
