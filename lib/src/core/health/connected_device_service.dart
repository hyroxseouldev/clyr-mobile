import 'package:clyr_mobile/src/core/health/entity/connected_device.dart';

abstract class ConnectedDeviceService {
  Future<List<ConnectedDevice>> getSelectedDevices();

  Future<void> setSelectedDevices(List<ConnectedDevice> devices);

  Future<List<String>> getSelectedSourceIds();
}
