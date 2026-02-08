import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart' show left, right;

/// Parameters for GetWorkoutsByDateUseCase
class GetWorkoutsByDateParams {
  const GetWorkoutsByDateParams({required this.date});

  final DateTime date;
}

/// Use case for getting workouts by date
class GetWorkoutsByDateUseCase {
  const GetWorkoutsByDateUseCase({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository;

  final HomeRepository _homeRepository;

  /// Execute the use case
  FutureEither<List<HealthWorkoutData>> call(GetWorkoutsByDateParams params) async {
    try {
      final date = params.date;
      debugPrint('📆 [GetWorkoutsByDateUseCase] Processing date: ${date.toString().split(' ')[0]}');

      // Call repository (handles date validation internally)
      final result = await _homeRepository.getWorkoutsByDate(date);

      return result.fold(
        (error) {
          // Special handling for no data error
          if (error.message?.contains('No workouts found') ?? false) {
            // Return empty list instead of error for better UX
            debugPrint('📭 [GetWorkoutsByDateUseCase] No data, returning empty list');
            return right(const <HealthWorkoutData>[]);
          }
          debugPrint('❌ [GetWorkoutsByDateUseCase] Error: ${error.message}');
          return left(error);
        },
        (workouts) {
          debugPrint('🎉 [GetWorkoutsByDateUseCase] Success: ${workouts.length} workouts');
          return right(workouts);
        },
      );
    } on ArgumentError catch (e) {
      debugPrint('⛔ [GetWorkoutsByDateUseCase] ArgumentError: $e');
      return left(AppException.home(e.toString()));
    } on Exception catch (e) {
      debugPrint('💥 [GetWorkoutsByDateUseCase] Exception: ${e.toString()}');
      return left(AppException.home(
        'Failed to get workouts: ${e.toString()}',
      ));
    }
  }
}
