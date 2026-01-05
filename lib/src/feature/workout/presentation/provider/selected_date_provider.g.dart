// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 선택한 날짜를 관리하는 Provider
/// 여러 페이지에서 공유하여 사용

@ProviderFor(SelectedDate)
final selectedDateProvider = SelectedDateProvider._();

/// 선택한 날짜를 관리하는 Provider
/// 여러 페이지에서 공유하여 사용
final class SelectedDateProvider
    extends $NotifierProvider<SelectedDate, DateTime> {
  /// 선택한 날짜를 관리하는 Provider
  /// 여러 페이지에서 공유하여 사용
  SelectedDateProvider._()
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
  String debugGetCreateSourceHash() => _$selectedDateHash();

  @$internal
  @override
  SelectedDate create() => SelectedDate();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime>(value),
    );
  }
}

String _$selectedDateHash() => r'855e440e991fffb2ac1d2d2b6d55c2fde513538d';

/// 선택한 날짜를 관리하는 Provider
/// 여러 페이지에서 공유하여 사용

abstract class _$SelectedDate extends $Notifier<DateTime> {
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
