import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_provider.g.dart';

/// 홈 리포지토리 프로바이더
@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(
    dataSource: ref.watch(coreDataSourceProvider),
  );
}
