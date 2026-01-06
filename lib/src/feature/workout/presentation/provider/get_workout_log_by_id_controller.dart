import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_log_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout_log_by_id_controller.g.dart';

/// 운동 로그 단건 조회 컨트롤러
///
/// ID로 운동 로그 단건을 조회
@riverpod
class GetWorkoutLogByIdController extends _$GetWorkoutLogByIdController {
  @override
  FutureOr<WorkoutLogEntity> build(String id) async {
    final usecases = ref.read(workoutLogUseCasesProvider);
    final result = await usecases.getWorkoutLogById((id: id));
    return result.fold((l) => throw l, (r) => r);
  }
}
