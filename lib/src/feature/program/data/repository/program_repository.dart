import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';

/// Program repository interface
/// Defines read operations for programs
abstract class ProgramRepository {
  /// Fetch list of public programs
  FutureEither<List<ProgramEntity>> getPrograms({int? limit, int? offset});

  /// Fetch single program by ID
  FutureEither<ProgramEntity> getProgramById(String id);
}
