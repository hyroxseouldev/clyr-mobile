// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_share_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Workout share provider
/// Manages state for workout sharing feature

@ProviderFor(WorkoutShare)
final workoutShareProvider = WorkoutShareFamily._();

/// Workout share provider
/// Manages state for workout sharing feature
final class WorkoutShareProvider
    extends $AsyncNotifierProvider<WorkoutShare, List<ShareImageEntity>> {
  /// Workout share provider
  /// Manages state for workout sharing feature
  WorkoutShareProvider._({
    required WorkoutShareFamily super.from,
    required HealthWorkoutData super.argument,
  }) : super(
         retry: null,
         name: r'workoutShareProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$workoutShareHash();

  @override
  String toString() {
    return r'workoutShareProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WorkoutShare create() => WorkoutShare();

  @override
  bool operator ==(Object other) {
    return other is WorkoutShareProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$workoutShareHash() => r'b0c6d23bdd7569bcb9b57ed5085539a215cad297';

/// Workout share provider
/// Manages state for workout sharing feature

final class WorkoutShareFamily extends $Family
    with
        $ClassFamilyOverride<
          WorkoutShare,
          AsyncValue<List<ShareImageEntity>>,
          List<ShareImageEntity>,
          FutureOr<List<ShareImageEntity>>,
          HealthWorkoutData
        > {
  WorkoutShareFamily._()
    : super(
        retry: null,
        name: r'workoutShareProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Workout share provider
  /// Manages state for workout sharing feature

  WorkoutShareProvider call(HealthWorkoutData workout) =>
      WorkoutShareProvider._(argument: workout, from: this);

  @override
  String toString() => r'workoutShareProvider';
}

/// Workout share provider
/// Manages state for workout sharing feature

abstract class _$WorkoutShare extends $AsyncNotifier<List<ShareImageEntity>> {
  late final _$args = ref.$arg as HealthWorkoutData;
  HealthWorkoutData get workout => _$args;

  FutureOr<List<ShareImageEntity>> build(HealthWorkoutData workout);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<ShareImageEntity>>, List<ShareImageEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ShareImageEntity>>,
                List<ShareImageEntity>
              >,
              AsyncValue<List<ShareImageEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
