import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_workout_controller.g.dart';

@riverpod
class CreateWorkoutController extends _$CreateWorkoutController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> createWorkoutLog(String workoutId, String log) async {
    final usecases = ref.read(workoutUseCasesProvider);
    final result = await usecases.createWorkoutLog((
      workoutId: workoutId,
      log: log,
    ));
    return result.fold((l) => throw l, (_) => null);
  }
}
