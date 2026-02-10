import 'package:clyr_mobile/src/feature/program/data/dto/program_dto.dart';

/// Program data source interface
/// Abstracts Supabase operations for program table
abstract class ProgramDataSource {
  /// Fetch list of public programs with coach profile
  Future<List<ProgramWithCoachDto>> getPrograms({int? limit, int? offset});

  /// Fetch single program by ID with coach profile and curriculum
  Future<ProgramWithCoachDto> getProgramById(String id);
}
