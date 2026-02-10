import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/program/data/data_source/program_data_source.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository.dart';

/// Program repository implementation
/// Handles read operations with error mapping and debug logging
class ProgramRepositoryImpl implements ProgramRepository {
  final ProgramDataSource _dataSource;

  ProgramRepositoryImpl(this._dataSource);

  @override
  FutureEither<List<ProgramEntity>> getPrograms({
    int? limit,
    int? offset,
  }) async {
    debugPrint('💪 [ProgramRepository] Fetching programs...');

    try {
      final dtos = await _dataSource.getPrograms(limit: limit, offset: offset);

      final entities = dtos.map((dto) => ProgramEntity.fromDto(dto)).toList();

      debugPrint('✅ [ProgramRepository] Fetched ${entities.length} programs');
      return right(entities);
    } catch (e) {
      debugPrint('❌ [ProgramRepository] Error fetching programs: $e');
      return left(
        AppException.program('Failed to fetch programs: ${e.toString()}'),
      );
    }
  }

  @override
  FutureEither<ProgramEntity> getProgramById(String id) async {
    debugPrint('💪 [ProgramRepository] Fetching program: $id');

    try {
      final dto = await _dataSource.getProgramById(id);
      final entity = ProgramEntity.fromDto(dto);

      debugPrint('✅ [ProgramRepository] Program fetched: ${entity.title}');
      return right(entity);
    } catch (e) {
      debugPrint('❌ [ProgramRepository] Error fetching program: $e');
      return left(
        AppException.program('Failed to fetch program: ${e.toString()}'),
      );
    }
  }
}
