import 'package:clyr_mobile/src/feature/workout/data/repository/workout_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/get_program_info_usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/get_workout_daily_usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/set_start_date_usecase.dart';

class WorkoutUseCases {
  final GetWorkoutDailyUseCase getWorkoutDaily;
  final SetStartDateUseCase setStartDate;
  final GetProgramInfoUseCase getProgramInfo;

  WorkoutUseCases({
    required this.getWorkoutDaily,
    required this.setStartDate,
    required this.getProgramInfo,
  });

  factory WorkoutUseCases.fromRepository(WorkoutRepository repository) {
    return WorkoutUseCases(
      getWorkoutDaily: GetWorkoutDailyUseCase(repository),
      setStartDate: SetStartDateUseCase(repository),
      getProgramInfo: GetProgramInfoUseCase(repository),
    );
  }
}
