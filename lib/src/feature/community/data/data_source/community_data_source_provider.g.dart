// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_data_source_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provides CommunityDataSource implementation using core Supabase client

@ProviderFor(communityDataSource)
final communityDataSourceProvider = CommunityDataSourceProvider._();

/// Provides CommunityDataSource implementation using core Supabase client

final class CommunityDataSourceProvider
    extends
        $FunctionalProvider<
          CommunityDataSource,
          CommunityDataSource,
          CommunityDataSource
        >
    with $Provider<CommunityDataSource> {
  /// Provides CommunityDataSource implementation using core Supabase client
  CommunityDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityDataSourceHash();

  @$internal
  @override
  $ProviderElement<CommunityDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommunityDataSource create(Ref ref) {
    return communityDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommunityDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommunityDataSource>(value),
    );
  }
}

String _$communityDataSourceHash() =>
    r'3d9ef9a3b4a3672a8e68170eafce2f92db700a3d';
