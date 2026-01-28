// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(coreDataSource)
final coreDataSourceProvider = CoreDataSourceProvider._();

final class CoreDataSourceProvider
    extends $FunctionalProvider<CoreDataSource, CoreDataSource, CoreDataSource>
    with $Provider<CoreDataSource> {
  CoreDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'coreDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$coreDataSourceHash();

  @$internal
  @override
  $ProviderElement<CoreDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CoreDataSource create(Ref ref) {
    return coreDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoreDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoreDataSource>(value),
    );
  }
}

String _$coreDataSourceHash() => r'3c2d9d2a44d2ea520dc58a896c6e47a2d5b2a02c';
