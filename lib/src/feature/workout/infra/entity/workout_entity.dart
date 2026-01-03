import 'package:clyr_mobile/src/feature/workout/data/dto/workout_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_entity.freezed.dart';

/// Workout session entity (detail unit)
@freezed
abstract class WorkoutSessionEntity with _$WorkoutSessionEntity {
  const factory WorkoutSessionEntity({
    required String id,
    required String workoutId,
    required String title,
    String? content,
    required int orderIndex,
  }) = _WorkoutSessionEntity;

  factory WorkoutSessionEntity.fromDto(WorkoutSessionsDto dto) {
    return WorkoutSessionEntity(
      id: dto.id,
      workoutId: dto.workoutId,
      title: dto.title,
      content: dto.content,
      orderIndex: dto.orderIndex,
    );
  }
}

/// Workout entity (day unit with sessions)
@freezed
abstract class WorkoutEntity with _$WorkoutEntity {
  const factory WorkoutEntity({
    required String id,
    required String programId,
    required String weekId,
    required int dayNumber,
    required String title,
    String? content,
    required DateTime createdAt,
    // Nested week info
    ProgramWeekEntity? programWeek,
    // Nested sessions (if fetched with nested query)
    List<WorkoutSessionEntity>? sessions,
  }) = _WorkoutEntity;

  factory WorkoutEntity.fromDto(WorkoutDto dto) {
    return WorkoutEntity(
      id: dto.id,
      programId: dto.programId,
      weekId: dto.weekId,
      dayNumber: dto.dayNumber,
      title: dto.title,
      content: dto.content,
      createdAt: dto.createdAt,
      programWeek: dto.programWeeks?.toEntity(),
      sessions: null, // Sessions are nested inside programWeeks.workouts
    );
  }

  /// Create from nested workout DTO (with sessions)
  factory WorkoutEntity.fromNestedDto(WorkoutsNestedDto dto) {
    return WorkoutEntity(
      id: dto.id,
      programId: dto.programId,
      weekId: dto.weekId,
      dayNumber: dto.dayNumber,
      title: dto.title,
      content: dto.content,
      createdAt: dto.createdAt,
      programWeek: null,
      sessions: dto.workoutSessions
          ?.map((s) => WorkoutSessionEntity.fromDto(s))
          .toList(),
    );
  }
}

/// Program week entity (section unit with workouts)
@freezed
abstract class ProgramWeekEntity with _$ProgramWeekEntity {
  const factory ProgramWeekEntity({
    required String id,
    required String programId,
    required int weekNumber,
    required String title,
    String? description,
    // Nested workouts (if fetched)
    List<WorkoutEntity>? workouts,
  }) = _ProgramWeekEntity;

  factory ProgramWeekEntity.fromDto(ProgramWeeksDto dto) {
    return ProgramWeekEntity(
      id: dto.id,
      programId: dto.programId,
      weekNumber: dto.weekNumber,
      title: dto.title,
      description: dto.description,
      workouts: dto.workouts
          ?.map((w) => WorkoutEntity.fromNestedDto(w))
          .toList(),
    );
  }
}
