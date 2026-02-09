// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'community_form_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Community form state for creating/editing

@ProviderFor(CommunityForm)
final communityFormProvider = CommunityFormFamily._();

/// Community form state for creating/editing
final class CommunityFormProvider
    extends $AsyncNotifierProvider<CommunityForm, CommunityEntity?> {
  /// Community form state for creating/editing
  CommunityFormProvider._({
    required CommunityFormFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'communityFormProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$communityFormHash();

  @override
  String toString() {
    return r'communityFormProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CommunityForm create() => CommunityForm();

  @override
  bool operator ==(Object other) {
    return other is CommunityFormProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$communityFormHash() => r'c952abe0d957d4ed438ab53d9110e5a69f75ffba';

/// Community form state for creating/editing

final class CommunityFormFamily extends $Family
    with
        $ClassFamilyOverride<
          CommunityForm,
          AsyncValue<CommunityEntity?>,
          CommunityEntity?,
          FutureOr<CommunityEntity?>,
          String?
        > {
  CommunityFormFamily._()
    : super(
        retry: null,
        name: r'communityFormProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Community form state for creating/editing

  CommunityFormProvider call({String? communityId}) =>
      CommunityFormProvider._(argument: communityId, from: this);

  @override
  String toString() => r'communityFormProvider';
}

/// Community form state for creating/editing

abstract class _$CommunityForm extends $AsyncNotifier<CommunityEntity?> {
  late final _$args = ref.$arg as String?;
  String? get communityId => _$args;

  FutureOr<CommunityEntity?> build({String? communityId});
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
    element.handleCreate(ref, () => build(communityId: _$args));
  }
}
