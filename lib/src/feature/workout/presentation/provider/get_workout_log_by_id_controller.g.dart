// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout_log_by_id_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 운동 로그 단건 조회 컨트롤러
///
/// ID로 운동 로그 단건을 조회

@ProviderFor(GetWorkoutLogByIdController)
final getWorkoutLogByIdControllerProvider =
    GetWorkoutLogByIdControllerFamily._();

/// 운동 로그 단건 조회 컨트롤러
///
/// ID로 운동 로그 단건을 조회
final class GetWorkoutLogByIdControllerProvider
    extends
        $AsyncNotifierProvider<GetWorkoutLogByIdController, WorkoutLogEntity> {
  /// 운동 로그 단건 조회 컨트롤러
  ///
  /// ID로 운동 로그 단건을 조회
  GetWorkoutLogByIdControllerProvider._({
    required GetWorkoutLogByIdControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getWorkoutLogByIdControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getWorkoutLogByIdControllerHash();

  @override
  String toString() {
    return r'getWorkoutLogByIdControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GetWorkoutLogByIdController create() => GetWorkoutLogByIdController();

  @override
  bool operator ==(Object other) {
    return other is GetWorkoutLogByIdControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getWorkoutLogByIdControllerHash() =>
    r'bf319aed53a5b1abcb0c99262a0a06cb9c15e056';

/// 운동 로그 단건 조회 컨트롤러
///
/// ID로 운동 로그 단건을 조회

final class GetWorkoutLogByIdControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          GetWorkoutLogByIdController,
          AsyncValue<WorkoutLogEntity>,
          WorkoutLogEntity,
          FutureOr<WorkoutLogEntity>,
          String
        > {
  GetWorkoutLogByIdControllerFamily._()
    : super(
        retry: null,
        name: r'getWorkoutLogByIdControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 운동 로그 단건 조회 컨트롤러
  ///
  /// ID로 운동 로그 단건을 조회

  GetWorkoutLogByIdControllerProvider call(String id) =>
      GetWorkoutLogByIdControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'getWorkoutLogByIdControllerProvider';
}

/// 운동 로그 단건 조회 컨트롤러
///
/// ID로 운동 로그 단건을 조회

abstract class _$GetWorkoutLogByIdController
    extends $AsyncNotifier<WorkoutLogEntity> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<WorkoutLogEntity> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<WorkoutLogEntity>, WorkoutLogEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WorkoutLogEntity>, WorkoutLogEntity>,
              AsyncValue<WorkoutLogEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
