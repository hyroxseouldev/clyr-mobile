import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository.dart';

/// Parameters for GetProgramsUseCase
class GetProgramsParams {
  const GetProgramsParams({this.limit, this.offset});

  final int? limit;
  final int? offset;
}

/// Use case for getting program list
class GetProgramsUseCase {
  const GetProgramsUseCase({required ProgramRepository programRepository})
    : _programRepository = programRepository;

  final ProgramRepository _programRepository;

  /// Execute the use case
  FutureEither<List<ProgramEntity>> call(GetProgramsParams params) async {
    return _programRepository.getPrograms(
      limit: params.limit,
      offset: params.offset,
    );
  }
}
