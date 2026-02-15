// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_connect_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DeviceConnectController)
final deviceConnectControllerProvider = DeviceConnectControllerProvider._();

final class DeviceConnectControllerProvider
    extends
        $AsyncNotifierProvider<DeviceConnectController, DeviceConnectState> {
  DeviceConnectControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deviceConnectControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deviceConnectControllerHash();

  @$internal
  @override
  DeviceConnectController create() => DeviceConnectController();
}

String _$deviceConnectControllerHash() =>
    r'4a799063e70df1932bd348e7e0edb4e4b5123350';

abstract class _$DeviceConnectController
    extends $AsyncNotifier<DeviceConnectState> {
  FutureOr<DeviceConnectState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<DeviceConnectState>, DeviceConnectState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<DeviceConnectState>, DeviceConnectState>,
              AsyncValue<DeviceConnectState>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
