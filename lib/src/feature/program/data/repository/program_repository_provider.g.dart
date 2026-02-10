// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides ProgramRepository implementation with injected DataSource

@ProviderFor(programRepository)
final programRepositoryProvider = ProgramRepositoryProvider._();

/// Provides ProgramRepository implementation with injected DataSource

final class ProgramRepositoryProvider
    extends
        $FunctionalProvider<
          ProgramRepository,
          ProgramRepository,
          ProgramRepository
        >
    with $Provider<ProgramRepository> {
  /// Provides ProgramRepository implementation with injected DataSource
  ProgramRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProgramRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProgramRepository create(Ref ref) {
    return programRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgramRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgramRepository>(value),
    );
  }
}

String _$programRepositoryHash() => r'1d3f5722bcc10ab63155cd79454c597692e57b85';
