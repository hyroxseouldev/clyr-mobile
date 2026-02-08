import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/health/health_service_provider.dart';
import 'package:clyr_mobile/src/core/permission/permission_service_provider.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_provider.g.dart';

/// Riverpod provider for HomeRepository
@riverpod
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl(
    dataSource: ref.watch(coreDataSourceProvider),
    healthService: ref.watch(healthServiceProvider),
    permissionService: ref.watch(permissionServiceProvider),
  );
}
