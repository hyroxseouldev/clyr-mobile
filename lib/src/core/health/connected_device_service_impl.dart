import 'package:clyr_mobile/src/core/health/connected_device_service.dart';
import 'package:clyr_mobile/src/core/health/entity/connected_device.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConnectedDeviceServiceImpl implements ConnectedDeviceService {
  ConnectedDeviceServiceImpl({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  static const String _selectedDevicesKey = 'selected_connected_devices';
  final FlutterSecureStorage _storage;

  @override
  Future<List<ConnectedDevice>> getSelectedDevices() async {
    final rawValue = await _storage.read(key: _selectedDevicesKey);
    if (rawValue == null || rawValue.isEmpty) {
      return const [ConnectedDevice.garmin];
    }

    final parsed = rawValue
        .split(',')
        .map((item) => ConnectedDeviceX.fromId(item.trim()))
        .whereType<ConnectedDevice>()
        .toSet()
        .toList();

    return parsed.isEmpty ? const [ConnectedDevice.garmin] : parsed;
  }

  @override
  Future<void> setSelectedDevices(List<ConnectedDevice> devices) async {
    if (devices.isEmpty) {
      await _storage.delete(key: _selectedDevicesKey);
      return;
    }

    final encoded = devices.map((device) => device.id).join(',');
    await _storage.write(key: _selectedDevicesKey, value: encoded);
  }

  @override
  Future<List<String>> getSelectedSourceIds() async {
    final devices = await getSelectedDevices();
    return devices.map((device) => device.sourceId).toList();
  }
}
