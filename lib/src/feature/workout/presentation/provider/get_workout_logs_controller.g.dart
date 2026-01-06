// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout_logs_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 운동 로그 페이지네이션 조회 컨트롤러

@ProviderFor(GetWorkoutLogsController)
final getWorkoutLogsControllerProvider = GetWorkoutLogsControllerProvider._();

/// 운동 로그 페이지네이션 조회 컨트롤러
final class GetWorkoutLogsControllerProvider
    extends
        $AsyncNotifierProvider<
          GetWorkoutLogsController,
          PaginatedData<WorkoutLogEntity>
        > {
  /// 운동 로그 페이지네이션 조회 컨트롤러
  GetWorkoutLogsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getWorkoutLogsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getWorkoutLogsControllerHash();

  @$internal
  @override
  GetWorkoutLogsController create() => GetWorkoutLogsController();
}

String _$getWorkoutLogsControllerHash() =>
    r'49600bdd1e849074a9424d4fe5d65e6b1db23de2';

/// 운동 로그 페이지네이션 조회 컨트롤러

abstract class _$GetWorkoutLogsController
    extends $AsyncNotifier<PaginatedData<WorkoutLogEntity>> {
  FutureOr<PaginatedData<WorkoutLogEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedData<WorkoutLogEntity>>,
              PaginatedData<WorkoutLogEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedData<WorkoutLogEntity>>,
                PaginatedData<WorkoutLogEntity>
              >,
              AsyncValue<PaginatedData<WorkoutLogEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
