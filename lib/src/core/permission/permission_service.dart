import 'package:clyr_mobile/src/core/permission/entity/permission_result.dart';
import 'package:clyr_mobile/src/core/permission/entity/permission_type.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';

/// Abstract permission service interface
abstract class PermissionService {
  /// Check current status of a single permission
  FutureEither<PermissionResult> checkPermission(PermissionType type);

  /// Check status of multiple permissions
  FutureEither<Map<PermissionType, PermissionResult>> checkPermissions(
    List<PermissionType> types,
  );

  /// Request a single permission
  FutureEither<PermissionResult> requestPermission(PermissionType type);

  /// Request multiple permissions (batch request)
  FutureEither<Map<PermissionType, PermissionResult>> requestPermissions(
    List<PermissionType> types,
  );

  /// Request all health-related permissions
  FutureEither<Map<PermissionType, PermissionResult>>
  requestHealthPermissions();

  /// Check if all health permissions are granted
  FutureEither<bool> areHealthPermissionsGranted();

  /// Open app settings for manual permission enablement
  FutureEither<void> openAppSettings();
}
