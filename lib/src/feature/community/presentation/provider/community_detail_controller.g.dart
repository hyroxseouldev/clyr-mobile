// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Community detail state

@ProviderFor(CommunityDetail)
final communityDetailProvider = CommunityDetailFamily._();

/// Community detail state
final class CommunityDetailProvider
    extends $AsyncNotifierProvider<CommunityDetail, CommunityEntity?> {
  /// Community detail state
  CommunityDetailProvider._({
    required CommunityDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'communityDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityDetailHash();

  @override
  String toString() {
    return r'communityDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommunityDetail create() => CommunityDetail();

  @override
  bool operator ==(Object other) {
    return other is CommunityDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityDetailHash() => r'7307b97ecd62dc3eae09da17af92c13fb8dbe7c4';

/// Community detail state

final class CommunityDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          CommunityDetail,
          AsyncValue<CommunityEntity?>,
          CommunityEntity?,
          FutureOr<CommunityEntity?>,
          String
        > {
  CommunityDetailFamily._()
    : super(
        retry: null,
        name: r'communityDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Community detail state

  CommunityDetailProvider call(String communityId) =>
      CommunityDetailProvider._(argument: communityId, from: this);

  @override
  String toString() => r'communityDetailProvider';
}

/// Community detail state

abstract class _$CommunityDetail extends $AsyncNotifier<CommunityEntity?> {
  late final _$args = ref.$arg as String;
  String get communityId => _$args;

  FutureOr<CommunityEntity?> build(String communityId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<CommunityEntity?>, CommunityEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CommunityEntity?>, CommunityEntity?>,
              AsyncValue<CommunityEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
