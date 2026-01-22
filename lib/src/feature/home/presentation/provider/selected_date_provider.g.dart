// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 화면에서 선택된 날짜 상태 관리

@ProviderFor(SelectedDateNotifier)
final selectedDateProvider = SelectedDateNotifierProvider._();

/// 홈 화면에서 선택된 날짜 상태 관리
final class SelectedDateNotifierProvider
    extends $NotifierProvider<SelectedDateNotifier, DateTime> {
  /// 홈 화면에서 선택된 날짜 상태 관리
  SelectedDateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedDateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedDateNotifierHash();

  @$internal
  @override
  SelectedDateNotifier create() => SelectedDateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$selectedDateNotifierHash() =>
    r'3ffe86596e821665fa6e202c8c589cca94f278f3';

/// 홈 화면에서 선택된 날짜 상태 관리

abstract class _$SelectedDateNotifier extends $Notifier<DateTime> {
  DateTime build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<DateTime, DateTime>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime, DateTime>,
              DateTime,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
