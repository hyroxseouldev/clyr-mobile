// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startup_health_sync_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(startupHealthSync)
final startupHealthSyncProvider = StartupHealthSyncProvider._();

final class StartupHealthSyncProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  StartupHealthSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'startupHealthSyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$startupHealthSyncHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return startupHealthSync(ref);
  }
}

String _$startupHealthSyncHash() => r'b56ad36f57a7979ca6ef1cba11f427433c7763e9';
