import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/data/repository/workoutlog_repository.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';

/// 운동 로그 생성 파라미터
typedef CreateWorkoutLogParams = ({
  String title,
  DateTime logDate,
  Map<String, dynamic> content,
  WorkoutIntensity intensity,
  String? programId,
});

/// 운동 로그 생성
class CreateWorkoutLogUseCase
    implements Usecase<CreateWorkoutLogParams, WorkoutLogEntity> {
  final WorkoutLogRepository _repository;

  CreateWorkoutLogUseCase(this._repository);

  @override
  FutureEither<AppException, WorkoutLogEntity> call(
    CreateWorkoutLogParams input,
  ) {
    return _repository.createWorkoutLog(
      title: input.title,
      logDate: input.logDate,
      content: input.content,
      intensity: input.intensity,
      programId: input.programId,
    );
  }
}

/// 운동 로그 페이지네이션 조회 파라미터
typedef GetWorkoutLogsParams = ({int page, int limit});

/// 운동 로그 페이지네이션 조회
class GetWorkoutLogsUseCase
    implements Usecase<GetWorkoutLogsParams, List<WorkoutLogEntity>> {
  final WorkoutLogRepository _repository;

  GetWorkoutLogsUseCase(this._repository);

  @override
  FutureEither<AppException, List<WorkoutLogEntity>> call(
    GetWorkoutLogsParams input,
  ) {
    return _repository.getWorkoutLogs(page: input.page, limit: input.limit);
  }
}

/// 운동 로그 단건 조회 파라미터
typedef GetWorkoutLogByIdParams = ({String id});

/// 운동 로그 단건 조회
class GetWorkoutLogByIdUseCase
    implements Usecase<GetWorkoutLogByIdParams, WorkoutLogEntity> {
  final WorkoutLogRepository _repository;

  GetWorkoutLogByIdUseCase(this._repository);

  @override
  FutureEither<AppException, WorkoutLogEntity> call(
    GetWorkoutLogByIdParams input,
  ) {
    return _repository.getWorkoutLogById(id: input.id);
  }
}

/// 운동 로그 수정 파라미터
typedef UpdateWorkoutLogParams = ({
  String id,
  String? title,
  DateTime? logDate,
  Map<String, dynamic>? content,
  WorkoutIntensity? intensity,
});

/// 운동 로그 수정
class UpdateWorkoutLogUseCase
    implements Usecase<UpdateWorkoutLogParams, WorkoutLogEntity> {
  final WorkoutLogRepository _repository;

  UpdateWorkoutLogUseCase(this._repository);

  @override
  FutureEither<AppException, WorkoutLogEntity> call(
    UpdateWorkoutLogParams input,
  ) {
    return _repository.updateWorkoutLog(
      id: input.id,
      title: input.title,
      logDate: input.logDate,
      content: input.content,
      intensity: input.intensity,
    );
  }
}

/// 운동 로그 삭제 파라미터
typedef DeleteWorkoutLogParams = ({String id});

/// 운동 로그 삭제
class DeleteWorkoutLogUseCase implements Usecase<DeleteWorkoutLogParams, void> {
  final WorkoutLogRepository _repository;

  DeleteWorkoutLogUseCase(this._repository);

  @override
  FutureEither<AppException, void> call(DeleteWorkoutLogParams input) {
    return _repository.deleteWorkoutLog(id: input.id);
  }
}

/// 운동 로그 관련 UseCase 모음
class WorkoutLogUseCases {
  final CreateWorkoutLogUseCase createWorkoutLog;
  final GetWorkoutLogsUseCase getWorkoutLogs;
  final GetWorkoutLogByIdUseCase getWorkoutLogById;
  final UpdateWorkoutLogUseCase updateWorkoutLog;
  final DeleteWorkoutLogUseCase deleteWorkoutLog;

  WorkoutLogUseCases({
    required this.createWorkoutLog,
    required this.getWorkoutLogs,
    required this.getWorkoutLogById,
    required this.updateWorkoutLog,
    required this.deleteWorkoutLog,
  });

  factory WorkoutLogUseCases.fromRepository(WorkoutLogRepository repository) {
    return WorkoutLogUseCases(
      createWorkoutLog: CreateWorkoutLogUseCase(repository),
      getWorkoutLogs: GetWorkoutLogsUseCase(repository),
      getWorkoutLogById: GetWorkoutLogByIdUseCase(repository),
      updateWorkoutLog: UpdateWorkoutLogUseCase(repository),
      deleteWorkoutLog: DeleteWorkoutLogUseCase(repository),
    );
  }
}
