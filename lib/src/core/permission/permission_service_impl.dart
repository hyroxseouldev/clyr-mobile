import 'dart:io';
import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:fpdart/fpdart.dart' show left, right;
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:health/health.dart' as health;
import 'package:clyr_mobile/src/core/permission/entity/permission_result.dart';
import 'package:clyr_mobile/src/core/permission/entity/permission_type.dart';
import 'package:clyr_mobile/src/core/permission/permission_service.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';

/// Permission service implementation using permission_handler
class PermissionServiceImpl implements PermissionService {
  PermissionServiceImpl({health.Health? healthFactory})
    : _health = healthFactory ?? health.Health();

  final health.Health _health;

  @override
  FutureEither<PermissionResult> checkPermission(PermissionType type) async {
    try {
      if (_isHealthPermission(type)) {
        return await _checkHealthPermission(type);
      } else {
        return await _checkStandardPermission(type);
      }
    } on Exception catch (e) {
      return left(
        AppException.permission(
          'Failed to check permission for ${type.name}: ${e.toString()}',
        ),
      );
    }
  }

  @override
  FutureEither<Map<PermissionType, PermissionResult>> checkPermissions(
    List<PermissionType> types,
  ) async {
    final results = <PermissionType, PermissionResult>{};
    final errors = <String>[];

    for (final type in types) {
      final result = await checkPermission(type);
      result.fold(
        (error) => errors.add('${type.name}: ${error.message}'),
        (status) => results[type] = status,
      );
    }

    if (errors.isNotEmpty && results.isEmpty) {
      return left(
        AppException.permission(
          'All permission checks failed: ${errors.join(', ')}',
        ),
      );
    }

    return right(results);
  }

  @override
  FutureEither<PermissionResult> requestPermission(PermissionType type) async {
    try {
      if (_isHealthPermission(type)) {
        return await _requestHealthPermission(type);
      } else {
        return await _requestStandardPermission(type);
      }
    } on Exception catch (e) {
      return left(
        AppException.permission(
          'Failed to request permission for ${type.name}: ${e.toString()}',
        ),
      );
    }
  }

  @override
  FutureEither<Map<PermissionType, PermissionResult>> requestPermissions(
    List<PermissionType> types,
  ) async {
    final results = <PermissionType, PermissionResult>{};
    final errors = <String>[];

    // Group health permissions for batch request
    final healthTypes = types.where(_isHealthPermission).toList();
    final standardTypes = types.where((t) => !_isHealthPermission(t)).toList();

    // Request health permissions in batch
    if (healthTypes.isNotEmpty) {
      final healthResult = await _requestHealthPermissionsBatch(
        healthTypes,
        access: health.HealthDataAccess.READ,
      );
      healthResult.fold(
        (error) => errors.add('Health: ${error.message}'),
        (statuses) => results.addAll(statuses),
      );
    }

    // Request standard permissions individually
    for (final type in standardTypes) {
      final result = await requestPermission(type);
      result.fold(
        (error) => errors.add('${type.name}: ${error.message}'),
        (status) => results[type] = status,
      );
    }

    if (errors.isNotEmpty && results.isEmpty) {
      return left(
        AppException.permission(
          'All permission requests failed: ${errors.join(', ')}',
        ),
      );
    }

    return right(results);
  }

  @override
  FutureEither<Map<PermissionType, PermissionResult>>
  requestHealthPermissions() async {
    return requestHealthReadPermissions();
  }

  @override
  FutureEither<Map<PermissionType, PermissionResult>>
  requestHealthReadPermissions() async {
    final healthTypes = [
      PermissionType.healthWorkout,
      PermissionType.healthSteps,
      PermissionType.healthEnergy,
      PermissionType.healthDistance,
      PermissionType.healthHeartRate,
      PermissionType.healthWorkoutRoute,
    ];

    return _requestHealthPermissionsBatch(
      healthTypes,
      access: health.HealthDataAccess.READ,
    );
  }

  @override
  FutureEither<PermissionResult> requestHealthWorkoutWritePermission() async {
    final result = await _requestHealthPermissionsBatch([
      PermissionType.healthWorkout,
    ], access: health.HealthDataAccess.WRITE);

    return result.fold(
      (error) => left(error),
      (statuses) => right(
        statuses[PermissionType.healthWorkout] ??
            const PermissionResult.denied(),
      ),
    );
  }

  @override
  FutureEither<bool> areHealthPermissionsGranted() async {
    return areHealthReadPermissionsGranted();
  }

  @override
  FutureEither<bool> areHealthReadPermissionsGranted() async {
    final healthTypes = [
      PermissionType.healthWorkout,
      PermissionType.healthSteps,
      PermissionType.healthEnergy,
      PermissionType.healthDistance,
      PermissionType.healthHeartRate,
      PermissionType.healthWorkoutRoute,
    ];

    final result = await checkPermissions(healthTypes);

    return result.fold((error) => left(error), (statuses) {
      final allGranted = statuses.values.every((status) => status.isGranted);
      return right(allGranted);
    });
  }

  @override
  FutureEither<bool> isHealthWorkoutWritePermissionGranted() async {
    final result = await _checkHealthPermission(PermissionType.healthWorkout);
    return result.fold(
      (error) => left(error),
      (status) => right(status.isGranted),
    );
  }

  @override
  FutureEither<void> openAppSettings() async {
    try {
      final opened = await ph.openAppSettings();
      if (!opened) {
        return left(AppException.permission('Failed to open app settings'));
      }
      return right(null);
    } on Exception catch (e) {
      return left(
        AppException.permission('Failed to open app settings: ${e.toString()}'),
      );
    }
  }

  // Private helper methods

  bool _isHealthPermission(PermissionType type) {
    return type == PermissionType.healthWorkout ||
        type == PermissionType.healthSteps ||
        type == PermissionType.healthEnergy ||
        type == PermissionType.healthDistance ||
        type == PermissionType.healthHeartRate ||
        type == PermissionType.healthWorkoutRoute;
  }

  ph.Permission _getStandardPermission(PermissionType type) {
    switch (type) {
      case PermissionType.storage:
        return ph.Permission.storage;
      case PermissionType.notifications:
        return ph.Permission.notification;
      default:
        throw ArgumentError('Unknown standard permission: $type');
    }
  }

  FutureEither<PermissionResult> _checkStandardPermission(
    PermissionType type,
  ) async {
    final permission = _getStandardPermission(type);
    final status = await permission.status;
    return right(_convertPermissionStatus(status));
  }

  FutureEither<PermissionResult> _requestStandardPermission(
    PermissionType type,
  ) async {
    final permission = _getStandardPermission(type);
    final status = await permission.request();
    return right(_convertPermissionStatus(status));
  }

  FutureEither<PermissionResult> _checkHealthPermission(
    PermissionType type,
  ) async {
    // For health permissions, we check if HealthKit/Health Connect is authorized
    try {
      final dataTypes = _getHealthDataTypes([type]);
      final hasPermissions = await _health.hasPermissions(dataTypes) ?? false;

      return right(
        hasPermissions
            ? const PermissionResult.granted()
            : const PermissionResult.denied(),
      );
    } catch (e) {
      return left(
        AppException.permission(
          'Failed to check health permission: ${e.toString()}',
        ),
      );
    }
  }

  FutureEither<PermissionResult> _requestHealthPermission(
    PermissionType type,
  ) async {
    return await _requestHealthPermissionsBatch([
      type,
    ], access: health.HealthDataAccess.READ).then(
      (result) => result.fold(
        (error) => left(error),
        (statuses) => right(
          statuses.values.firstOrNull ?? const PermissionResult.denied(),
        ),
      ),
    );
  }

  FutureEither<Map<PermissionType, PermissionResult>>
  _requestHealthPermissionsBatch(
    List<PermissionType> types, {
    required health.HealthDataAccess access,
  }) async {
    try {
      if (Platform.isIOS) {
        return _requestIOSHealthPermissions(types, access: access);
      } else if (Platform.isAndroid) {
        return _requestAndroidHealthPermissions(types, access: access);
      } else {
        return left(
          AppException.permission(
            'Platform not supported for health permissions',
          ),
        );
      }
    } on Exception catch (e) {
      return left(
        AppException.permission(
          'Failed to request health permissions: ${e.toString()}',
        ),
      );
    }
  }

  FutureEither<Map<PermissionType, PermissionResult>>
  _requestIOSHealthPermissions(
    List<PermissionType> types, {
    required health.HealthDataAccess access,
  }) async {
    final dataTypes = _getHealthDataTypes(types);

    // Create permissions list with same length as dataTypes
    final permissions = List.generate(dataTypes.length, (_) => access);

    // Request HealthKit permissions
    final requested = await _health.requestAuthorization(
      dataTypes,
      permissions: permissions,
    );

    final results = <PermissionType, PermissionResult>{};
    for (final type in types) {
      // On iOS, authorization is all-or-nothing for HealthKit
      results[type] = requested
          ? const PermissionResult.granted()
          : const PermissionResult.denied();
    }

    return right(results);
  }

  FutureEither<Map<PermissionType, PermissionResult>>
  _requestAndroidHealthPermissions(
    List<PermissionType> types, {
    required health.HealthDataAccess access,
  }) async {
    // Android Health Connect integration
    final dataTypes = _getHealthDataTypes(types);

    try {
      // Create permissions list with same length as dataTypes
      final permissions = List.generate(dataTypes.length, (_) => access);

      // Request Health Connect permissions
      final requested = await _health.requestAuthorization(
        dataTypes,
        permissions: permissions,
      );

      final results = <PermissionType, PermissionResult>{};
      for (final type in types) {
        results[type] = requested
            ? const PermissionResult.granted()
            : const PermissionResult.denied();
      }

      return right(results);
    } catch (e) {
      // Health Connect might not be installed
      return left(
        AppException.permission(
          'Health Connect not available or request failed: ${e.toString()}',
        ),
      );
    }
  }

  List<health.HealthDataType> _getHealthDataTypes(List<PermissionType> types) {
    final dataTypes = <health.HealthDataType>[];

    for (final type in types) {
      switch (type) {
        case PermissionType.healthWorkout:
          dataTypes.add(health.HealthDataType.WORKOUT);
          break;
        case PermissionType.healthSteps:
          dataTypes.add(health.HealthDataType.STEPS);
          break;
        case PermissionType.healthEnergy:
          dataTypes.add(health.HealthDataType.ACTIVE_ENERGY_BURNED);
          break;
        case PermissionType.healthDistance:
          dataTypes.add(health.HealthDataType.DISTANCE_WALKING_RUNNING);
          break;
        case PermissionType.healthHeartRate:
          dataTypes.add(health.HealthDataType.HEART_RATE);
          break;
        case PermissionType.healthWorkoutRoute:
          dataTypes.add(health.HealthDataType.WORKOUT_ROUTE);
          break;
        default:
          break;
      }
    }

    return dataTypes;
  }

  PermissionResult _convertPermissionStatus(ph.PermissionStatus status) {
    switch (status) {
      case ph.PermissionStatus.granted:
        return const PermissionResult.granted();
      case ph.PermissionStatus.denied:
        return const PermissionResult.denied();
      case ph.PermissionStatus.permanentlyDenied:
        return const PermissionResult.permanentlyDenied();
      case ph.PermissionStatus.limited:
        return const PermissionResult.limited();
      case ph.PermissionStatus.provisional:
        return const PermissionResult.provisional();
      case ph.PermissionStatus.restricted:
        return const PermissionResult.restricted();
    }
  }
}
