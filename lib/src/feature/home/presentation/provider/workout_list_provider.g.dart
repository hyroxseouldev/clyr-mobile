// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for workout list state

@ProviderFor(WorkoutList)
final workoutListProvider = WorkoutListProvider._();

/// Provider for workout list state
final class WorkoutListProvider
    extends $AsyncNotifierProvider<WorkoutList, List<HealthWorkoutData>> {
  /// Provider for workout list state
  WorkoutListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutListHash();

  @$internal
  @override
  WorkoutList create() => WorkoutList();
}

String _$workoutListHash() => r'2521ce9d43f1229dd50b7c6fc48edb2fe85cb896';

/// Provider for workout list state

abstract class _$WorkoutList extends $AsyncNotifier<List<HealthWorkoutData>> {
  FutureOr<List<HealthWorkoutData>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<HealthWorkoutData>>,
              List<HealthWorkoutData>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<HealthWorkoutData>>,
                List<HealthWorkoutData>
              >,
              AsyncValue<List<HealthWorkoutData>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
