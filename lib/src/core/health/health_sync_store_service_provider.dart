import 'package:clyr_mobile/src/core/health/health_sync_store_service.dart';
import 'package:clyr_mobile/src/core/health/health_sync_store_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_sync_store_service_provider.g.dart';

@Riverpod(keepAlive: true)
HealthSyncStoreService healthSyncStoreService(Ref ref) {
  return HealthSyncStoreServiceImpl();
}
