// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutUseCases)
final workoutUseCasesProvider = WorkoutUseCasesProvider._();

final class WorkoutUseCasesProvider
    extends
        $FunctionalProvider<WorkoutUseCases, WorkoutUseCases, WorkoutUseCases>
    with $Provider<WorkoutUseCases> {
  WorkoutUseCasesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutUseCasesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutUseCasesHash();

  @$internal
  @override
  $ProviderElement<WorkoutUseCases> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkoutUseCases create(Ref ref) {
    return workoutUseCases(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutUseCases value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutUseCases>(value),
    );
  }
}

String _$workoutUseCasesHash() => r'00120496fb4e0c111ddd599edf28a8bad921c4fa';
