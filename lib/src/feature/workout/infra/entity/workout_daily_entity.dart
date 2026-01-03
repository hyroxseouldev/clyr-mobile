import 'package:freezed_annotation/freezed_annotation.dart';
import 'workout_entity.dart';

part 'workout_daily_entity.freezed.dart';

/// Enrollment 시작 날짜와 연계된 하루 단위 워크아웃 엔티티
///
/// - 오늘 날짜를 기준으로 enrollment 시작 날짜와 비교하여 dayNumber 계산
/// - 시작 날짜 설정 여부와 해당 날짜의 워크아웃 정보를 포함
@freezed
abstract class WorkoutDailyEntity with _$WorkoutDailyEntity {
  const factory WorkoutDailyEntity({
    /// enrollment 시작 날짜가 설정되었는지 여부
    required bool isStartDateSet,

    /// 미래 날짜 접근 제한 여부 (4일 뒤 이후 접근 불가)
    required bool isFutureRestricted,

    /// 시작 날짜 이전 여부 (프로그램 시작 전)
    required bool isBeforeStartDate,

    /// 해당 날짜의 워크아웃 정보 (설정된 시작 날짜로부터 계산된 dayNumber)
    ///
    /// - null: 해당 날짜에 할당된 워크아웃 없음 (휴식일 또는 프로그램 기간 종료)
    /// - 값: 계산된 dayNumber에 해당하는 워크아웃과 세션 정보
    WorkoutWithSession? workout,
  }) = _WorkoutDailyEntity;

  /// 시작 날짜 미설정 상태 생성 (초기 상태)
  factory WorkoutDailyEntity.noStartDate() {
    return const WorkoutDailyEntity(
      isStartDateSet: false,
      isFutureRestricted: false,
      isBeforeStartDate: false,
      workout: null,
    );
  }

  /// 시작 날짜 설정된 상태 생성
  factory WorkoutDailyEntity.withStartDate({
    required WorkoutWithSession? workout,
  }) {
    return WorkoutDailyEntity(
      isStartDateSet: true,
      isFutureRestricted: false,
      isBeforeStartDate: false,
      workout: workout,
    );
  }

  /// 미래 날짜 접근 제한 상태 생성 (4일 뒤 이후)
  factory WorkoutDailyEntity.futureRestricted() {
    return const WorkoutDailyEntity(
      isStartDateSet: true,
      isFutureRestricted: true,
      isBeforeStartDate: false,
      workout: null,
    );
  }

  /// 시작 날짜 이전 상태 생성 (프로그램 시작 전)
  factory WorkoutDailyEntity.beforeStartDate() {
    return const WorkoutDailyEntity(
      isStartDateSet: true,
      isFutureRestricted: false,
      isBeforeStartDate: true,
      workout: null,
    );
  }
}

/// 워크아웃과 세션을 포함한复合 엔티티
@freezed
abstract class WorkoutWithSession with _$WorkoutWithSession {
  const factory WorkoutWithSession({
    /// 기본 워크아웃 정보
    required WorkoutEntity workout,

    /// 워크아웃에 속한 세션 목록
    required List<WorkoutSessionEntity> sessions,

    /// enrollment 시작 날짜로부터 계산된 상대 dayNumber
    /// (예: 시작일이 1일차, 시작일+1이 2일차)
    required int relativeDayNumber,
  }) = _WorkoutWithSession;

  /// DTO와 세션으로부터 생성
  factory WorkoutWithSession.fromEntities({
    required WorkoutEntity workout,
    required List<WorkoutSessionEntity> sessions,
    required int relativeDayNumber,
  }) {
    return WorkoutWithSession(
      workout: workout,
      sessions: sessions,
      relativeDayNumber: relativeDayNumber,
    );
  }
}
