enum ConnectedDevice { garmin }

extension ConnectedDeviceX on ConnectedDevice {
  String get id => switch (this) {
    ConnectedDevice.garmin => 'garmin',
  };

  String get sourceId => switch (this) {
    ConnectedDevice.garmin => 'com.garmin.connect.mobile',
  };

  static ConnectedDevice? fromId(String value) => switch (value) {
    'garmin' => ConnectedDevice.garmin,
    _ => null,
  };
}
