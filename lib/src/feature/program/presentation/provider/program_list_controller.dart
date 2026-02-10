import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/program_usecase_provider.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/get_programs_usecase.dart';

part 'program_list_controller.g.dart';

/// Program list state
@riverpod
class ProgramList extends _$ProgramList {
  @override
  Future<List<ProgramEntity>> build() async {
    final usecase = ref.watch(getProgramsUseCaseProvider);
    final params = const GetProgramsParams();
    final result = await usecase(params);
    return result.fold((error) => throw error, (programs) => programs);
  }

  /// Refresh the program list
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final usecase = ref.watch(getProgramsUseCaseProvider);
    final params = const GetProgramsParams();
    final result = await usecase(params);
    state = result.fold(
      (error) => AsyncValue.error(error, StackTrace.current),
      (programs) => AsyncValue.data(programs),
    );
  }
}
