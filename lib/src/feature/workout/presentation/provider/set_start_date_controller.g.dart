// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_start_date_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SetStartDateController)
final setStartDateControllerProvider = SetStartDateControllerProvider._();

final class SetStartDateControllerProvider
    extends $NotifierProvider<SetStartDateController, AsyncValue<void>> {
  SetStartDateControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'setStartDateControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$setStartDateControllerHash();

  @$internal
  @override
  SetStartDateController create() => SetStartDateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$setStartDateControllerHash() =>
    r'ea3a0c1e3900b76fd6375f7627314eba4f7cc5c5';

abstract class _$SetStartDateController extends $Notifier<AsyncValue<void>> {
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
