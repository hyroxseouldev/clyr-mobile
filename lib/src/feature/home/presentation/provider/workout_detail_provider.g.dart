// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WorkoutDetail)
final workoutDetailProvider = WorkoutDetailFamily._();

final class WorkoutDetailProvider
    extends $AsyncNotifierProvider<WorkoutDetail, HealthWorkoutData?> {
  WorkoutDetailProvider._({
    required WorkoutDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'workoutDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$workoutDetailHash();

  @override
  String toString() {
    return r'workoutDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  WorkoutDetail create() => WorkoutDetail();

  @override
  bool operator ==(Object other) {
    return other is WorkoutDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$workoutDetailHash() => r'861803a1bcf8e695494d6fb27a47de29b207e74b';

final class WorkoutDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          WorkoutDetail,
          AsyncValue<HealthWorkoutData?>,
          HealthWorkoutData?,
          FutureOr<HealthWorkoutData?>,
          String
        > {
  WorkoutDetailFamily._()
    : super(
        retry: null,
        name: r'workoutDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  WorkoutDetailProvider call(String workoutId) =>
      WorkoutDetailProvider._(argument: workoutId, from: this);

  @override
  String toString() => r'workoutDetailProvider';
}

abstract class _$WorkoutDetail extends $AsyncNotifier<HealthWorkoutData?> {
  late final _$args = ref.$arg as String;
  String get workoutId => _$args;

  FutureOr<HealthWorkoutData?> build(String workoutId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<HealthWorkoutData?>, HealthWorkoutData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HealthWorkoutData?>, HealthWorkoutData?>,
              AsyncValue<HealthWorkoutData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
