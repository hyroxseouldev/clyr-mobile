// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Community list state

@ProviderFor(CommunityList)
final communityListProvider = CommunityListProvider._();

/// Community list state
final class CommunityListProvider
    extends $AsyncNotifierProvider<CommunityList, List<CommunityEntity>> {
  /// Community list state
  CommunityListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communityListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communityListHash();

  @$internal
  @override
  CommunityList create() => CommunityList();
}

String _$communityListHash() => r'3cca6f9d69c13d5dc76d5c54c14c06170e34c978';

/// Community list state

abstract class _$CommunityList extends $AsyncNotifier<List<CommunityEntity>> {
  FutureOr<List<CommunityEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<CommunityEntity>>, List<CommunityEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<CommunityEntity>>,
                List<CommunityEntity>
              >,
              AsyncValue<List<CommunityEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
