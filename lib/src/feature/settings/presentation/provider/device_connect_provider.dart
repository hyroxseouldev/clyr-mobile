import 'package:clyr_mobile/src/core/health/connected_device_service_provider.dart';
import 'package:clyr_mobile/src/core/health/entity/connected_device.dart';
import 'package:clyr_mobile/src/core/permission/permission_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_connect_provider.g.dart';

class DeviceConnectState {
  const DeviceConnectState({
    required this.selectedDevices,
    required this.isHealthReadGranted,
    required this.isHealthWriteGranted,
  });

  final List<ConnectedDevice> selectedDevices;
  final bool isHealthReadGranted;
  final bool isHealthWriteGranted;

  DeviceConnectState copyWith({
    List<ConnectedDevice>? selectedDevices,
    bool? isHealthReadGranted,
    bool? isHealthWriteGranted,
  }) {
    return DeviceConnectState(
      selectedDevices: selectedDevices ?? this.selectedDevices,
      isHealthReadGranted: isHealthReadGranted ?? this.isHealthReadGranted,
      isHealthWriteGranted: isHealthWriteGranted ?? this.isHealthWriteGranted,
    );
  }
}

@riverpod
class DeviceConnectController extends _$DeviceConnectController {
  @override
  Future<DeviceConnectState> build() async {
    final connectedDeviceService = ref.watch(connectedDeviceServiceProvider);
    final permissionService = ref.watch(permissionServiceProvider);

    final selectedDevices = await connectedDeviceService.getSelectedDevices();
    final readGrantedResult = await permissionService
        .areHealthReadPermissionsGranted();
    final writeGrantedResult = await permissionService
        .isHealthWorkoutWritePermissionGranted();

    final isHealthReadGranted = readGrantedResult.fold((_) => false, (v) => v);
    final isHealthWriteGranted = writeGrantedResult.fold(
      (_) => false,
      (v) => v,
    );

    return DeviceConnectState(
      selectedDevices: selectedDevices,
      isHealthReadGranted: isHealthReadGranted,
      isHealthWriteGranted: isHealthWriteGranted,
    );
  }

  Future<void> selectSingleDevice(ConnectedDevice device) async {
    final connectedDeviceService = ref.read(connectedDeviceServiceProvider);
    await connectedDeviceService.setSelectedDevices([device]);

    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(currentState.copyWith(selectedDevices: [device]));
    }
  }

  Future<void> requestHealthReadPermissions() async {
    final permissionService = ref.read(permissionServiceProvider);
    await permissionService.requestHealthReadPermissions();
    await refreshPermissionStatus();
  }

  Future<void> requestHealthWorkoutWritePermission() async {
    final permissionService = ref.read(permissionServiceProvider);
    await permissionService.requestHealthWorkoutWritePermission();
    await refreshPermissionStatus();
  }

  Future<void> refreshPermissionStatus() async {
    final permissionService = ref.read(permissionServiceProvider);
    final currentState = state.value;
    if (currentState == null) {
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(build);
      return;
    }

    final readGrantedResult = await permissionService
        .areHealthReadPermissionsGranted();
    final writeGrantedResult = await permissionService
        .isHealthWorkoutWritePermissionGranted();

    state = AsyncValue.data(
      currentState.copyWith(
        isHealthReadGranted: readGrantedResult.fold((_) => false, (v) => v),
        isHealthWriteGranted: writeGrantedResult.fold((_) => false, (v) => v),
      ),
    );
  }

  Future<void> openAppSettings() async {
    final permissionService = ref.read(permissionServiceProvider);
    await permissionService.openAppSettings();
  }
}
