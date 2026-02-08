import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_workout_by_id_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/home_usecase_provider.dart';

part 'workout_detail_provider.g.dart';

@riverpod
class WorkoutDetail extends _$WorkoutDetail {
  @override
  Future<HealthWorkoutData?> build(String workoutId) async {
    final usecase = ref.watch(getWorkoutByIdUseCaseProvider);
    final params = GetWorkoutByIdParams(id: workoutId);

    final result = await usecase(params);

    return result.fold(
      (error) => throw error,
      (workout) => workout,
    );
  }
}
