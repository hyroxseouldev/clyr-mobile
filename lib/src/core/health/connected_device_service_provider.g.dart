// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_device_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectedDeviceService)
final connectedDeviceServiceProvider = ConnectedDeviceServiceProvider._();

final class ConnectedDeviceServiceProvider
    extends
        $FunctionalProvider<
          ConnectedDeviceService,
          ConnectedDeviceService,
          ConnectedDeviceService
        >
    with $Provider<ConnectedDeviceService> {
  ConnectedDeviceServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectedDeviceServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectedDeviceServiceHash();

  @$internal
  @override
  $ProviderElement<ConnectedDeviceService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectedDeviceService create(Ref ref) {
    return connectedDeviceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectedDeviceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectedDeviceService>(value),
    );
  }
}

String _$connectedDeviceServiceHash() =>
    r'c0cd2b5eaf3c95d2b9d3ba6ff649ee7cdfd0272c';
