// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_data_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides ProgramDataSource implementation using core Supabase client

@ProviderFor(programDataSource)
final programDataSourceProvider = ProgramDataSourceProvider._();

/// Provides ProgramDataSource implementation using core Supabase client

final class ProgramDataSourceProvider
    extends
        $FunctionalProvider<
          ProgramDataSource,
          ProgramDataSource,
          ProgramDataSource
        >
    with $Provider<ProgramDataSource> {
  /// Provides ProgramDataSource implementation using core Supabase client
  ProgramDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programDataSourceHash();

  @$internal
  @override
  $ProviderElement<ProgramDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProgramDataSource create(Ref ref) {
    return programDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProgramDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProgramDataSource>(value),
    );
  }
}

String _$programDataSourceHash() => r'49c57349a2f8d586125bd568879b80cfe9571581';
