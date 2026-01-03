// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_workout_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CreateWorkoutController)
final createWorkoutControllerProvider = CreateWorkoutControllerProvider._();

final class CreateWorkoutControllerProvider
    extends $AsyncNotifierProvider<CreateWorkoutController, void> {
  CreateWorkoutControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createWorkoutControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createWorkoutControllerHash();

  @$internal
  @override
  CreateWorkoutController create() => CreateWorkoutController();
}

String _$createWorkoutControllerHash() =>
    r'e3810a5d7d65c79167fe26f915eea18b7c991f48';

abstract class _$CreateWorkoutController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
