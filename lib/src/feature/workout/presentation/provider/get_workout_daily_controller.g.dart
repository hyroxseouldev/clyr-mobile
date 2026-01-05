// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_workout_daily_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
///
/// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환

@ProviderFor(GetWorkoutDailyController)
final getWorkoutDailyControllerProvider = GetWorkoutDailyControllerFamily._();

/// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
///
/// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환
final class GetWorkoutDailyControllerProvider
    extends
        $AsyncNotifierProvider<GetWorkoutDailyController, WorkoutDailyEntity> {
  /// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
  ///
  /// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환
  GetWorkoutDailyControllerProvider._({
    required GetWorkoutDailyControllerFamily super.from,
    required (DateTime, String) super.argument,
  }) : super(
         retry: null,
         name: r'getWorkoutDailyControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getWorkoutDailyControllerHash();

  @override
  String toString() {
    return r'getWorkoutDailyControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  GetWorkoutDailyController create() => GetWorkoutDailyController();

  @override
  bool operator ==(Object other) {
    return other is GetWorkoutDailyControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getWorkoutDailyControllerHash() =>
    r'8bdbbe2fb520eb9abc2b91f6a72c1f4a063929ba';

/// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
///
/// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환

final class GetWorkoutDailyControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          GetWorkoutDailyController,
          AsyncValue<WorkoutDailyEntity>,
          WorkoutDailyEntity,
          FutureOr<WorkoutDailyEntity>,
          (DateTime, String)
        > {
  GetWorkoutDailyControllerFamily._()
    : super(
        retry: null,
        name: r'getWorkoutDailyControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
  ///
  /// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환

  GetWorkoutDailyControllerProvider call(
    DateTime targetDate,
    String programId,
  ) => GetWorkoutDailyControllerProvider._(
    argument: (targetDate, programId),
    from: this,
  );

  @override
  String toString() => r'getWorkoutDailyControllerProvider';
}

/// 특정 날짜의 워크아웃 일일 정보 조회 컨트롤러
///
/// 날짜와 프로그램 ID를 받아 해당 프로그램의 enrollment에 대한 워크아웃 정보를 반환

abstract class _$GetWorkoutDailyController
    extends $AsyncNotifier<WorkoutDailyEntity> {
  late final _$args = ref.$arg as (DateTime, String);
  DateTime get targetDate => _$args.$1;
  String get programId => _$args.$2;

  FutureOr<WorkoutDailyEntity> build(DateTime targetDate, String programId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<WorkoutDailyEntity>, WorkoutDailyEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<WorkoutDailyEntity>, WorkoutDailyEntity>,
              AsyncValue<WorkoutDailyEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args.$1, _$args.$2));
  }
}
