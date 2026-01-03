import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_daily_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_start_date_controller.g.dart';

@riverpod
class SetStartDateController extends _$SetStartDateController {
  @override
  AsyncValue<void> build() => const AsyncValue.data(null);

  Future<void> setStartDate({
    required DateTime date,
    required Function() onSuccess,
  }) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final usecases = ref.read(workoutUseCasesProvider);
      final result = await usecases.setStartDate((date: date));
      return result.fold((l) => throw l, (r) {
        ref
            .read(getWorkoutDailyControllerProvider(date).notifier)
            .refresh(date);
        onSuccess();
        return r;
      });
    });
  }
}
