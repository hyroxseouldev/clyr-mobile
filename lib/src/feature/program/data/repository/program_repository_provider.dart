import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/program/data/data_source/program_data_source_provider.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository.dart';
import 'package:clyr_mobile/src/feature/program/data/repository/program_repository_impl.dart';

part 'program_repository_provider.g.dart';

/// Provides ProgramRepository implementation with injected DataSource
@Riverpod(keepAlive: true)
ProgramRepository programRepository(Ref ref) {
  final dataSource = ref.watch(programDataSourceProvider);
  return ProgramRepositoryImpl(dataSource);
}
