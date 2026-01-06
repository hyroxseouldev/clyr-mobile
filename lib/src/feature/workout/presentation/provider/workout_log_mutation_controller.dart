import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_log_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_log_mutation_controller.g.dart';

/// 운동 로그 생성 컨트롤러
@riverpod
class CreateWorkoutLogController extends _$CreateWorkoutLogController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> createWorkoutLog({
    required String title,
    required DateTime logDate,
    required Map<String, dynamic> content,
    required WorkoutIntensity intensity,
    String? programId,
    required Function(WorkoutLogEntity) onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(workoutLogUseCasesProvider);
      final result = await usecases.createWorkoutLog((
        title: title,
        logDate: logDate,
        content: content,
        intensity: intensity,
        programId: programId,
      ));
      return result.fold((l) => throw l, (r) {
        onSuccess(r);
        return r;
      });
    });
  }
}

/// 운동 로그 수정 컨트롤러
@riverpod
class UpdateWorkoutLogController extends _$UpdateWorkoutLogController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> updateWorkoutLog({
    required String id,
    String? title,
    DateTime? logDate,
    Map<String, dynamic>? content,
    WorkoutIntensity? intensity,
    required Function(WorkoutLogEntity) onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(workoutLogUseCasesProvider);
      final result = await usecases.updateWorkoutLog((
        id: id,
        title: title,
        logDate: logDate,
        content: content,
        intensity: intensity,
      ));
      return result.fold((l) => throw l, (r) {
        onSuccess(r);
        return r;
      });
    });
  }
}

/// 운동 로그 삭제 컨트롤러
@riverpod
class DeleteWorkoutLogController extends _$DeleteWorkoutLogController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> deleteWorkoutLog({
    required String id,
    required Function() onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(workoutLogUseCasesProvider);
      final result = await usecases.deleteWorkoutLog((id: id));
      return result.fold((l) => throw l, (r) {
        onSuccess();
        return r;
      });
    });
  }
}
