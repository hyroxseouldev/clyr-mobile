import 'package:clyr_mobile/src/core/health/health_service.dart';
import 'package:clyr_mobile/src/core/health/health_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'health_service_provider.g.dart';

/// Riverpod provider for HealthService
@riverpod
HealthService healthService(Ref ref) {
  return HealthServiceImpl();
}
