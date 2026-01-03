// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GetWorkoutController)
final getWorkoutControllerProvider = GetWorkoutControllerProvider._();

final class GetWorkoutControllerProvider
    extends $AsyncNotifierProvider<GetWorkoutController, List<WorkoutEntity>> {
  GetWorkoutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getWorkoutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getWorkoutControllerHash();

  @$internal
  @override
  GetWorkoutController create() => GetWorkoutController();
}

String _$getWorkoutControllerHash() =>
    r'47eb790151484626fc3fae463314a40bbaf15fbd';

abstract class _$GetWorkoutController
    extends $AsyncNotifier<List<WorkoutEntity>> {
  FutureOr<List<WorkoutEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<WorkoutEntity>>, List<WorkoutEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WorkoutEntity>>, List<WorkoutEntity>>,
              AsyncValue<List<WorkoutEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
