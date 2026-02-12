// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_share_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Workout share controller
/// Manages action states (download, share) for workout sharing

@ProviderFor(WorkoutShareController)
final workoutShareControllerProvider = WorkoutShareControllerProvider._();

/// Workout share controller
/// Manages action states (download, share) for workout sharing
final class WorkoutShareControllerProvider
    extends $NotifierProvider<WorkoutShareController, AsyncValue<void>> {
  /// Workout share controller
  /// Manages action states (download, share) for workout sharing
  WorkoutShareControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutShareControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutShareControllerHash();

  @$internal
  @override
  WorkoutShareController create() => WorkoutShareController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$workoutShareControllerHash() =>
    r'93e7ddcdff770b17154a8098ddf845636f89d2a1';

/// Workout share controller
/// Manages action states (download, share) for workout sharing

abstract class _$WorkoutShareController extends $Notifier<AsyncValue<void>> {
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
