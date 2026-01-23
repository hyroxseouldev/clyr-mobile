import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/feature/log/data/repository/log_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log_repository_provider.g.dart';

/// Log 리포지토리 프로바이더
@riverpod
LogRepository logRepository(Ref ref) {
  return LogRepositoryImpl(
    dataSource: ref.watch(coreDataSourceProvider),
  );
}
