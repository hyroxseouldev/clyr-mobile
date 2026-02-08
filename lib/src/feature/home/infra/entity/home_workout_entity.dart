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
    int? totalEnergyBurned,
    double? totalDistance,
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
  String? get formattedDistance {
    if (totalDistance == null) return null;
    final km = totalDistance! / 1000;
    return '${km.toStringAsFixed(2)} km';
  }

  /// Formatted calories
  String? get formattedCalories {
    if (totalEnergyBurned == null) return null;
    return '$totalEnergyBurned kcal';
  }

  /// Display name for workout type (localized)
  String get workoutTypeDisplayName => workoutType.displayName;
}

/// Create HomeWorkoutEntity from WorkoutData
HomeWorkoutEntity homeWorkoutEntityFromWorkoutData(HealthWorkoutData data) {
  return HomeWorkoutEntity(
    id: data.id,
    workoutType: data.workoutType,
    startTime: data.startTime,
    endTime: data.endTime,
    duration: data.duration,
    totalEnergyBurned: data.totalEnergyBurned,
    totalDistance: data.totalDistance,
  );
}
