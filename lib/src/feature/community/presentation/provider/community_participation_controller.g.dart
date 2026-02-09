// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_participation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Community participation controller

@ProviderFor(CommunityParticipation)
final communityParticipationProvider = CommunityParticipationFamily._();

/// Community participation controller
final class CommunityParticipationProvider
    extends $NotifierProvider<CommunityParticipation, ParticipationStatus> {
  /// Community participation controller
  CommunityParticipationProvider._({
    required CommunityParticipationFamily super.from,
    required ({String communityId, bool isMember}) super.argument,
  }) : super(
         retry: null,
         name: r'communityParticipationProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityParticipationHash();

  @override
  String toString() {
    return r'communityParticipationProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  CommunityParticipation create() => CommunityParticipation();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ParticipationStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ParticipationStatus>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommunityParticipationProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityParticipationHash() =>
    r'f2d8e47db0711a402a0b2111b00c909884ea8c23';

/// Community participation controller

final class CommunityParticipationFamily extends $Family
    with
        $ClassFamilyOverride<
          CommunityParticipation,
          ParticipationStatus,
          ParticipationStatus,
          ParticipationStatus,
          ({String communityId, bool isMember})
        > {
  CommunityParticipationFamily._()
    : super(
        retry: null,
        name: r'communityParticipationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Community participation controller

  CommunityParticipationProvider call({
    required String communityId,
    required bool isMember,
  }) => CommunityParticipationProvider._(
    argument: (communityId: communityId, isMember: isMember),
    from: this,
  );

  @override
  String toString() => r'communityParticipationProvider';
}

/// Community participation controller

abstract class _$CommunityParticipation extends $Notifier<ParticipationStatus> {
  late final _$args = ref.$arg as ({String communityId, bool isMember});
  String get communityId => _$args.communityId;
  bool get isMember => _$args.isMember;

  ParticipationStatus build({
    required String communityId,
    required bool isMember,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ParticipationStatus, ParticipationStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ParticipationStatus, ParticipationStatus>,
              ParticipationStatus,
              Object?,
              Object?
            >;
    element.handleCreate(
      ref,
      () => build(communityId: _$args.communityId, isMember: _$args.isMember),
    );
  }
}
