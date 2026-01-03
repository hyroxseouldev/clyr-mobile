import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';

class GetWorkoutDailyUseCase
    implements Usecase<GetWorkoutDailyParams, WorkoutDailyEntity> {
  final WorkoutRepository _repository;

  GetWorkoutDailyUseCase(this._repository);

  @override
  FutureEither<AppException, WorkoutDailyEntity> call(
    GetWorkoutDailyParams input,
  ) async {
    return await _repository.getWorkoutDaily(input.targetDate);
  }
}

/// GetWorkoutDailyUseCase 파라미터
typedef GetWorkoutDailyParams = ({DateTime targetDate});
