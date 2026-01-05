import 'package:clyr_mobile/src/core/usecase/usecase.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/usecase/workout_usecase_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_program_info_controller.g.dart';

/// Program 정보 조회 컨트롤러
///
/// 현재 사용자의 활성화된 enrollments의 program 정보를 반환
@riverpod
class GetProgramInfoController extends _$GetProgramInfoController {
  @override
  FutureOr<List<ProgramEntity>> build() async {
    final usecases = ref.read(workoutUseCasesProvider);
    final result = await usecases.getProgramInfo(NoParams());
    return result.fold((l) => throw l, (r) => r);
  }
}
