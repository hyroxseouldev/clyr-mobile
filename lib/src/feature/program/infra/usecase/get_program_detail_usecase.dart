import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository.dart';

/// Parameters for GetProgramDetailUseCase
class GetProgramDetailParams {
  const GetProgramDetailParams({required this.id});

  final String id;
}

/// Use case for getting single program by ID
class GetProgramDetailUseCase {
  const GetProgramDetailUseCase({required ProgramRepository programRepository})
    : _programRepository = programRepository;

  final ProgramRepository _programRepository;

  /// Execute the use case
  FutureEither<ProgramEntity> call(GetProgramDetailParams params) async {
    return _programRepository.getProgramById(params.id);
  }
}
