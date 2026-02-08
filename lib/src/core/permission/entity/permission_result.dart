import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_result.freezed.dart';

/// Result of a permission request or status check
@freezed
class PermissionResult with _$PermissionResult {
  const factory PermissionResult.granted() = GrantedPermission;
  const factory PermissionResult.denied() = DeniedPermission;
  const factory PermissionResult.permanentlyDenied() = PermanentlyDeniedPermission;
  const factory PermissionResult.limited() = LimitedPermission;
  const factory PermissionResult.provisional() = ProvisionalPermission;
  const factory PermissionResult.restricted() = RestrictedPermission;

  const PermissionResult._();

  /// Check if permission is granted (including limited/provisional)
  bool get isGranted => this is GrantedPermission ||
      this is LimitedPermission ||
      this is ProvisionalPermission;

  /// Check if permission can be requested again
  bool get canRequest => this is DeniedPermission;

  /// User must enable in settings
  bool get requiresSettings => this is PermanentlyDeniedPermission ||
      this is RestrictedPermission;
}
