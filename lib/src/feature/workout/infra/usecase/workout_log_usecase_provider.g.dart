// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutLogUseCases)
final workoutLogUseCasesProvider = WorkoutLogUseCasesProvider._();

final class WorkoutLogUseCasesProvider
    extends
        $FunctionalProvider<
          WorkoutLogUseCases,
          WorkoutLogUseCases,
          WorkoutLogUseCases
        >
    with $Provider<WorkoutLogUseCases> {
  WorkoutLogUseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutLogUseCasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutLogUseCasesHash();

  @$internal
  @override
  $ProviderElement<WorkoutLogUseCases> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkoutLogUseCases create(Ref ref) {
    return workoutLogUseCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutLogUseCases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutLogUseCases>(value),
    );
  }
}

String _$workoutLogUseCasesHash() =>
    r'0267b793c0a6c2c8df36caa331b6427a05c144cf';
