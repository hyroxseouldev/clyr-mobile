import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';

/// Abstract health service interface
abstract class HealthService {
  /// Fetch workout data within date range
  ///
  /// Returns [FutureEither] with list of [WorkoutData] or [AppException]
  ///
  /// Parameters:
  /// - [startDate]: Start of date range (inclusive)
  /// - [endDate]: End of date range (inclusive)
  /// - [limit]: Maximum number of workouts to fetch (optional)
  FutureEither<List<HealthWorkoutData>> getWorkouts({
    required DateTime startDate,
    required DateTime endDate,
    int? limit,
    List<String>? sourceIds,
  });

  /// Get latest workout within date range
  FutureEither<HealthWorkoutData?> getLatestWorkout({
    required DateTime startDate,
    required DateTime endDate,
    required List<String> sourceIds,
  });
}
