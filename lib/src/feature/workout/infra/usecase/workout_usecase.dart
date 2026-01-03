import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';

typedef GetWorkoutsParams = void;
typedef CreateWorkoutLogParams = ({String workoutId, String log});

class GetWorkoutsUseCase
    implements Usecase<GetWorkoutsParams, List<WorkoutEntity>> {
  final WorkoutRepository _repository;
  GetWorkoutsUseCase(this._repository);

  @override
  FutureEither<AppException, List<WorkoutEntity>> call(
    GetWorkoutsParams input,
  ) {
    return _repository.getWorkouts();
  }
}

class CreateWorkoutLogUseCase implements Usecase<CreateWorkoutLogParams, void> {
  final WorkoutRepository _repository;
  CreateWorkoutLogUseCase(this._repository);

  @override
  FutureEither<WorkoutException, void> call(CreateWorkoutLogParams input) {
    return _repository.createWorkoutLog(input);
  }
}

class WorkoutUseCases {
  final GetWorkoutsUseCase getWorkouts;
  final CreateWorkoutLogUseCase createWorkoutLog;

  WorkoutUseCases({required this.getWorkouts, required this.createWorkoutLog});

  factory WorkoutUseCases.fromRepository(WorkoutRepository repository) {
    return WorkoutUseCases(
      getWorkouts: GetWorkoutsUseCase(repository),
      createWorkoutLog: CreateWorkoutLogUseCase(repository),
    );
  }
}
