/// Permission types supported by the app
enum PermissionType {
  // Health permissions
  healthWorkout,
  healthSteps,
  healthEnergy,
  healthDistance,
  healthHeartRate,

  // Storage (for exporting data)
  storage,

  // Notifications (for reminders)
  notifications,
}

extension PermissionTypeExtension on PermissionType {
  String get displayName {
    switch (this) {
      case PermissionType.healthWorkout:
        return 'Workout Data';
      case PermissionType.healthSteps:
        return 'Step Count';
      case PermissionType.healthEnergy:
        return 'Active Energy';
      case PermissionType.healthDistance:
        return 'Distance';
      case PermissionType.healthHeartRate:
        return 'Heart Rate';
      case PermissionType.storage:
        return 'Storage';
      case PermissionType.notifications:
        return 'Notifications';
    }
  }
}
