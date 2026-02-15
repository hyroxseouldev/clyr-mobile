import 'package:clyr_mobile/src/core/health/connected_device_service.dart';
import 'package:clyr_mobile/src/core/health/connected_device_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connected_device_service_provider.g.dart';

@Riverpod(keepAlive: true)
ConnectedDeviceService connectedDeviceService(Ref ref) {
  return ConnectedDeviceServiceImpl();
}
