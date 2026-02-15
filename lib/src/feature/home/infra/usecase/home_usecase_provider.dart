import 'package:clyr_mobile/src/feature/home/data/repository/home_repository_provider.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/create_section_record_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_active_program_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_blueprint_sections_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_workout_by_id_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/get_workouts_by_date_usecase.dart';
import 'package:clyr_mobile/src/feature/home/infra/usecase/sync_connected_device_workouts_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_usecase_provider.g.dart';

/// 홈 UseCase 프로바이더
@riverpod
GetActiveProgramUseCase getActiveProgramUseCase(Ref ref) {
  return GetActiveProgramUseCase(ref.watch(homeRepositoryProvider));
}

/// 오늘의 세션 조회 UseCase 프로바이더
@riverpod
GetTodaysSessionUseCase getTodaysSessionUseCase(Ref ref) {
  return GetTodaysSessionUseCase(ref.watch(homeRepositoryProvider));
}

/// 섹션 완료 기록 생성 UseCase 프로바이더
@riverpod
CreateSectionRecordUseCase createSectionRecordUseCase(Ref ref) {
  return CreateSectionRecordUseCase(ref.watch(homeRepositoryProvider));
}

/// Riverpod provider for GetWorkoutsByDateUseCase
@riverpod
GetWorkoutsByDateUseCase getWorkoutsByDateUseCase(Ref ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);

  return GetWorkoutsByDateUseCase(homeRepository: homeRepository);
}

/// Riverpod provider for GetWorkoutByIdUseCase
@riverpod
GetWorkoutByIdUseCase getWorkoutByIdUseCase(Ref ref) {
  return GetWorkoutByIdUseCase(ref.watch(homeRepositoryProvider));
}

@riverpod
SyncConnectedDeviceWorkoutsUseCase syncConnectedDeviceWorkoutsUseCase(Ref ref) {
  final repository = ref.watch(homeRepositoryProvider);
  return SyncConnectedDeviceWorkoutsUseCase(repository: repository);
}
