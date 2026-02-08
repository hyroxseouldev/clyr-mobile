// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Riverpod provider for HomeRepository
///
/// NOTE: Using TestHomeRepository for simulator testing
/// To use real HealthKit data, replace TestHomeRepository with HomeRepositoryImpl

@ProviderFor(homeRepository)
final homeRepositoryProvider = HomeRepositoryProvider._();

/// Riverpod provider for HomeRepository
///
/// NOTE: Using TestHomeRepository for simulator testing
/// To use real HealthKit data, replace TestHomeRepository with HomeRepositoryImpl

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  /// Riverpod provider for HomeRepository
  ///
  /// NOTE: Using TestHomeRepository for simulator testing
  /// To use real HealthKit data, replace TestHomeRepository with HomeRepositoryImpl
  HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'dc49c2378c9fdd9e611ab910cd38f9eec60a9e89';
