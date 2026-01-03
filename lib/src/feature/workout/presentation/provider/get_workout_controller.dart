import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout_controller.g.dart';

@riverpod
class GetWorkoutController extends _$GetWorkoutController {
  @override
  FutureOr<List<WorkoutEntity>> build() async {
    final usecases = ref.read(workoutUseCasesProvider);
    final result = await usecases.getWorkouts(null);
    return result.fold((l) => throw l, (r) => r);
  }
}
