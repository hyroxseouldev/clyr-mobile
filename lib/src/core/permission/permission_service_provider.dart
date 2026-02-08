import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/permission/permission_service.dart';
import 'package:clyr_mobile/src/core/permission/permission_service_impl.dart';

part 'permission_service_provider.g.dart';

/// Riverpod provider for PermissionService
@riverpod
PermissionService permissionService(Ref ref) {
  return PermissionServiceImpl();
}
