// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workoutlog_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workoutLogRepository)
final workoutLogRepositoryProvider = WorkoutLogRepositoryProvider._();

final class WorkoutLogRepositoryProvider
    extends
        $FunctionalProvider<
          WorkoutLogRepository,
          WorkoutLogRepository,
          WorkoutLogRepository
        >
    with $Provider<WorkoutLogRepository> {
  WorkoutLogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workoutLogRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workoutLogRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkoutLogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkoutLogRepository create(Ref ref) {
    return workoutLogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkoutLogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkoutLogRepository>(value),
    );
  }
}

String _$workoutLogRepositoryHash() =>
    r'af24b8a7877585d414530e230918cc426c2ee880';
