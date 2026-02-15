import 'package:clyr_mobile/src/core/data/data_source.dart';
import 'package:clyr_mobile/src/core/health/connected_device_service_provider.dart';
import 'package:clyr_mobile/src/core/health/health_sync_store_service_provider.dart';
import 'package:clyr_mobile/src/core/health/health_service_provider.dart';
import 'package:clyr_mobile/src/core/permission/permission_service_provider.dart';
import 'package:clyr_mobile/src/feature/home/data/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_provider.g.dart';

/// Riverpod provider for HomeRepository
///
/// NOTE: Using TestHomeRepository for simulator testing
/// To use real HealthKit data, replace TestHomeRepository with HomeRepositoryImpl
@riverpod
HomeRepository homeRepository(Ref ref) {
  // // TODO: Switch back to HomeRepositoryImpl for production
  // return TestHomeRepository();

  // Production code (uncomment to use real HealthKit):
  return HomeRepositoryImpl(
    dataSource: ref.watch(coreDataSourceProvider),
    healthService: ref.watch(healthServiceProvider),
    permissionService: ref.watch(permissionServiceProvider),
    connectedDeviceService: ref.watch(connectedDeviceServiceProvider),
    healthSyncStoreService: ref.watch(healthSyncStoreServiceProvider),
  );
}
