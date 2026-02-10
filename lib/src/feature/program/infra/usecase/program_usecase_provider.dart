import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository_provider.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/get_programs_usecase.dart';
import 'package:clyr_mobile/src/feature/program/infra/usecase/get_program_detail_usecase.dart';

part 'program_usecase_provider.g.dart';

/// Provides GetProgramsUseCase
@Riverpod(keepAlive: true)
GetProgramsUseCase getProgramsUseCase(Ref ref) {
  final repository = ref.watch(programRepositoryProvider);
  return GetProgramsUseCase(programRepository: repository);
}

/// Provides GetProgramDetailUseCase
@Riverpod(keepAlive: true)
GetProgramDetailUseCase getProgramDetailUseCase(Ref ref) {
  final repository = ref.watch(programRepositoryProvider);
  return GetProgramDetailUseCase(programRepository: repository);
}
