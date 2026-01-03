import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout_daily_controller.g.dart';

/// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
///
/// 날짜 파라미터를 받아 해당 날짜의 워크아웃 정보를 반환
@riverpod
class GetWorkoutDailyController extends _$GetWorkoutDailyController {
  @override
  FutureOr<WorkoutDailyEntity> build(DateTime targetDate) async {
    final usecases = ref.read(workoutUseCasesProvider);
    final result = await usecases.getWorkoutDaily(
      (targetDate: targetDate),
    );
    return result.fold((l) => throw l, (r) => r);
  }

  /// 대상 날짜 변경 및 재조회
  Future<void> refresh(DateTime newDate) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(workoutUseCasesProvider);
      final result = await usecases.getWorkoutDaily(
        (targetDate: newDate),
      );
      return result.fold((l) => throw l, (r) => r);
    });
  }
}
