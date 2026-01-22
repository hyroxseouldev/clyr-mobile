// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_record_create_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 섹션 완료 기록 생성 컨트롤러

@ProviderFor(SectionRecordCreateController)
final sectionRecordCreateControllerProvider =
    SectionRecordCreateControllerProvider._();

/// 섹션 완료 기록 생성 컨트롤러
final class SectionRecordCreateControllerProvider
    extends $NotifierProvider<SectionRecordCreateController, AsyncValue<void>> {
  /// 섹션 완료 기록 생성 컨트롤러
  SectionRecordCreateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sectionRecordCreateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sectionRecordCreateControllerHash();

  @$internal
  @override
  SectionRecordCreateController create() => SectionRecordCreateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$sectionRecordCreateControllerHash() =>
    r'e0445f96242b980f9b6dc0550d9c8ff98366c262';

/// 섹션 완료 기록 생성 컨트롤러

abstract class _$SectionRecordCreateController
    extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
