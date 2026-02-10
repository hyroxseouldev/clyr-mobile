import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/program_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/get_program_detail_usecase.dart';

part 'program_detail_controller.g.dart';

/// Program detail state
@riverpod
class ProgramDetail extends _$ProgramDetail {
  @override
  Future<ProgramEntity?> build(String programId) async {
    final usecase = ref.watch(getProgramDetailUseCaseProvider);
    final params = GetProgramDetailParams(id: programId);
    final result = await usecase(params);
    return result.fold((error) => throw error, (program) => program);
  }

  /// Refresh program detail
  Future<void> refresh() async {
    final programId = state.value?.id ?? '';
    if (programId.isEmpty) return;

    state = const AsyncValue.loading();
    final usecase = ref.watch(getProgramDetailUseCaseProvider);
    final params = GetProgramDetailParams(id: programId);
    final result = await usecase(params);
    state = result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (program) => AsyncValue.data(program),
    );
  }
}
