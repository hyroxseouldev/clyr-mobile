// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_sync_store_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(healthSyncStoreService)
final healthSyncStoreServiceProvider = HealthSyncStoreServiceProvider._();

final class HealthSyncStoreServiceProvider
    extends
        $FunctionalProvider<
          HealthSyncStoreService,
          HealthSyncStoreService,
          HealthSyncStoreService
        >
    with $Provider<HealthSyncStoreService> {
  HealthSyncStoreServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'healthSyncStoreServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$healthSyncStoreServiceHash();

  @$internal
  @override
  $ProviderElement<HealthSyncStoreService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  HealthSyncStoreService create(Ref ref) {
    return healthSyncStoreService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HealthSyncStoreService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HealthSyncStoreService>(value),
    );
  }
}

String _$healthSyncStoreServiceHash() =>
    r'bf329e4ae17aba751593224fc255b91f3782fa08';
