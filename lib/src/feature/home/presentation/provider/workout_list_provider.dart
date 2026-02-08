import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_workouts_by_date_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_list_provider.g.dart';

/// Provider for workout list state
@riverpod
class WorkoutList extends _$WorkoutList {
  @override
  Future<List<HealthWorkoutData>> build() async {
    // Watch the home date for changes
    final homeDate = ref.watch(selectedDateProvider);

    // Get the use case
    final useCase = ref.watch(getWorkoutsByDateUseCaseProvider);

    // Fetch workouts
    final result = await useCase(GetWorkoutsByDateParams(date: homeDate));

    // Convert FutureEither to AsyncValue
    return result.fold(
      (error) => throw Exception(error.message),
      (workouts) => workouts,
    );
  }

  /// Refresh the workout list (for pull-to-refresh)
  Future<void> refresh() async {
    // Invalidate the provider to force refetch
    ref.invalidateSelf();
  }
}
