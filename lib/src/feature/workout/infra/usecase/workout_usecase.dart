import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/get_workout_daily_usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/set_start_date_usecase.dart';

typedef CreateWorkoutLogParams = ({String workoutId, String log});

class CreateWorkoutLogUseCase implements Usecase<CreateWorkoutLogParams, void> {
  final WorkoutRepository _repository;
  CreateWorkoutLogUseCase(this._repository);

  @override
  FutureEither<WorkoutException, void> call(CreateWorkoutLogParams input) {
    return _repository.createWorkoutLog(input);
  }
}

class WorkoutUseCases {
  final CreateWorkoutLogUseCase createWorkoutLog;
  final GetWorkoutDailyUseCase getWorkoutDaily;
  final SetStartDateUseCase setStartDate;

  WorkoutUseCases({
    required this.createWorkoutLog,
    required this.getWorkoutDaily,
    required this.setStartDate,
  });

  factory WorkoutUseCases.fromRepository(WorkoutRepository repository) {
    return WorkoutUseCases(
      createWorkoutLog: CreateWorkoutLogUseCase(repository),
      getWorkoutDaily: GetWorkoutDailyUseCase(repository),
      setStartDate: SetStartDateUseCase(repository),
    );
  }
}
