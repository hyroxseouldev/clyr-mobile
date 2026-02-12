import 'package:flutter/foundation.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/health/health_service.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:fpdart/fpdart.dart' show left, right;
import 'package:health/health.dart';

/// Health service implementation using health package
class HealthServiceImpl implements HealthService {
  HealthServiceImpl({Health? healthFactory})
    : _health = healthFactory ?? Health();

  final Health _health;

  @override
  FutureEither<List<HealthWorkoutData>> getWorkouts({
    required DateTime startDate,
    required DateTime endDate,
    int? limit,
  }) async {
    try {
      // Fetch workout data
      final healthData = await _health
          .getHealthDataFromTypes(
            startTime: startDate,
            endTime: endDate,
            types: [HealthDataType.WORKOUT],
          )
          .timeout(const Duration(seconds: 5));

      if (healthData.isEmpty) {
        return left(AppException.noData('No workouts found in date range'));
      }

      // Fetch heart rate data for the entire date range
      final heartRateData = await _health.getHealthDataFromTypes(
        startTime: startDate,
        endTime: endDate,
        types: [HealthDataType.HEART_RATE],
      );

      // Convert to WorkoutData entities with heart rates
      final workouts = healthData
          .map((data) => _convertToWorkoutData(data, heartRateData))
          .where((workout) => workout != null)
          .cast<HealthWorkoutData>()
          .toList();

      // Sort by start time (newest first)
      workouts.sort((a, b) => b.startTime.compareTo(a.startTime));

      // Apply limit if specified
      final result = limit != null && limit > 0
          ? workouts.take(limit).toList()
          : workouts;

      if (result.isEmpty) {
        return left(AppException.noData('No valid workouts found'));
      }

      return right(result);
    } on Exception catch (e) {
      return left(
        AppException.health('Failed to fetch workouts: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<HealthWorkoutData?> getLatestWorkout({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final result = await getWorkouts(
      startDate: startDate,
      endDate: endDate,
      limit: 1,
    );

    return result.fold(
      (error) => left(error),
      (workouts) => right(workouts.isEmpty ? null : workouts.first),
    );
  }

  /// Convert health package data to WorkoutData entity
  HealthWorkoutData? _convertToWorkoutData(
    HealthDataPoint data,
    List<HealthDataPoint> allHeartRates,
  ) {
    try {
      // Get workout summary which contains workout type
      final summary = data.workoutSummary;
      if (summary == null) return null;

      // Convert workout type string to enum
      final workoutType = _parseWorkoutType(summary.workoutType);

      // Filter heart rates within workout time range (inclusive)
      debugPrint(
        '💪 [HealthService] Total HR samples in date range: ${allHeartRates.length}',
      );
      debugPrint(
        '💪 [HealthService] Workout range: ${data.dateFrom} ~ ${data.dateTo}',
      );

      final workoutHeartRates = allHeartRates
          .where(
            (hr) =>
                !hr.dateFrom.isBefore(data.dateFrom) &&
                !hr.dateTo.isAfter(data.dateTo),
          )
          .map((hr) => (hr.value as NumericHealthValue).numericValue.toInt())
          .toList();

      debugPrint(
        '💪 [HealthService] Matched heart rates: ${workoutHeartRates.length}',
      );
      if (workoutHeartRates.isNotEmpty) {
        final minHr = workoutHeartRates.reduce((a, b) => a < b ? a : b);
        final maxHr = workoutHeartRates.reduce((a, b) => a > b ? a : b);
        debugPrint('💪 [HealthService] HR range: $minHr - $maxHr bpm');
      } else {
        debugPrint(
          '💪 [HealthService] ⚠️ No heart rate data found for this workout',
        );
      }

      return HealthWorkoutData(
        id: data.uuid,
        workoutType: workoutType,
        startTime: data.dateFrom,
        endTime: data.dateTo,
        duration: data.dateTo.difference(data.dateFrom),
        totalEnergyBurned: summary.totalEnergyBurned.toInt(),
        totalDistance: summary.totalDistance.toDouble(),
        heartRates: workoutHeartRates,
        metadata: {
          'unit': data.unit.name,
          'sourceId': data.sourceId,
          'totalSteps': summary.totalSteps.toInt(),
          'workoutType': summary.workoutType,
        },
      );
    } catch (e) {
      return null; // Skip invalid data
    }
  }

  /// Parse workout type string to HealthWorkoutActivityType
  HealthWorkoutType _parseWorkoutType(String workoutTypeString) {
    // Map string to WorkoutType enum
    final typeMap = <String, HealthWorkoutType>{
      // Direct matches
      'RUNNING': HealthWorkoutType.running,
      'WALKING': HealthWorkoutType.walking,
      'CYCLING': HealthWorkoutType.cycling,
      'BIKING': HealthWorkoutType.cycling,
      'SWIMMING': HealthWorkoutType.swimming,
      'HIKING': HealthWorkoutType.hiking,
      'FITNESS': HealthWorkoutType.fitness,
      // Additional workout types
      'AMERICAN_FOOTBALL': HealthWorkoutType.other,
      'ARCHERY': HealthWorkoutType.other,
      'AUSTRALIAN_FOOTBALL': HealthWorkoutType.other,
      'BADMINTON': HealthWorkoutType.fitness,
      'BASEBALL': HealthWorkoutType.fitness,
      'BASKETBALL': HealthWorkoutType.fitness,
      'BOXING': HealthWorkoutType.fitness,
      'CARDIO_DANCE': HealthWorkoutType.fitness,
      'CRICKET': HealthWorkoutType.fitness,
      'CROSS_COUNTRY_SKIING': HealthWorkoutType.fitness,
      'CURLING': HealthWorkoutType.fitness,
      'DOWNHILL_SKIING': HealthWorkoutType.fitness,
      'ELLIPTICAL': HealthWorkoutType.fitness,
      'FENCING': HealthWorkoutType.fitness,
      'GOLF': HealthWorkoutType.fitness,
      'GYMNASTICS': HealthWorkoutType.fitness,
      'HANDBALL': HealthWorkoutType.fitness,
      'HIGH_INTENSITY_INTERVAL_TRAINING': HealthWorkoutType.fitness,
      'HOCKEY': HealthWorkoutType.fitness,
      'JUMP_ROPE': HealthWorkoutType.fitness,
      'KICKBOXING': HealthWorkoutType.fitness,
      'MARTIAL_ARTS': HealthWorkoutType.fitness,
      'PILATES': HealthWorkoutType.fitness,
      'RACQUETBALL': HealthWorkoutType.fitness,
      'ROWING': HealthWorkoutType.fitness,
      'RUGBY': HealthWorkoutType.fitness,
      'SAILING': HealthWorkoutType.fitness,
      'SKATING': HealthWorkoutType.fitness,
      'SNOWBOARDING': HealthWorkoutType.fitness,
      'SOCCER': HealthWorkoutType.fitness,
      'SOFTBALL': HealthWorkoutType.fitness,
      'SQUASH': HealthWorkoutType.fitness,
      'STAIR_CLIMBING': HealthWorkoutType.fitness,
      'TABLE_TENNIS': HealthWorkoutType.fitness,
      'TENNIS': HealthWorkoutType.fitness,
      'VOLLEYBALL': HealthWorkoutType.fitness,
      'WATER_POLO': HealthWorkoutType.fitness,
      'YOGA': HealthWorkoutType.fitness,
      // iOS only
      'BARRE': HealthWorkoutType.fitness,
      'BOWLING': HealthWorkoutType.fitness,
    };

    return typeMap[workoutTypeString.toUpperCase()] ?? HealthWorkoutType.other;
  }
}
