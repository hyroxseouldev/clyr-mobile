// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_share_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Workout share repository provider

@ProviderFor(workoutShareRepository)
final workoutShareRepositoryProvider = WorkoutShareRepositoryProvider._();

/// Workout share repository provider

final class WorkoutShareRepositoryProvider
    extends
        $FunctionalProvider<
          WorkoutShareRepository,
          WorkoutShareRepository,
          WorkoutShareRepository
        >
    with $Provider<WorkoutShareRepository> {
  /// Workout share repository provider
  WorkoutShareRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutShareRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutShareRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkoutShareRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkoutShareRepository create(Ref ref) {
    return workoutShareRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutShareRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutShareRepository>(value),
    );
  }
}

String _$workoutShareRepositoryHash() =>
    r'e4c21e2c40cb4f8bbd859e9ad715d63b4a6afa5c';
