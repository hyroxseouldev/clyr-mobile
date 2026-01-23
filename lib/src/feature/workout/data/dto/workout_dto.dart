import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';

part 'workout_dto.g.dart';

// Program DTO (from programs table)
@JsonSerializable()
class ProgramDto {
  final String id;
  final String name;
  @JsonKey(name: 'program_image')
  final String? programImage;
  @JsonKey(name: 'main_image_list')
  final List<String>? mainImageList;
  final String? description;

  ProgramDto({
    required this.id,
    required this.name,
    this.programImage,
    this.mainImageList,
    this.description,
  });

  factory ProgramDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramDtoToJson(this);

  ProgramEntity toEntity() => ProgramEntity.fromDto(this);
}

// Main DTO for workouts with nested week and sessions
@JsonSerializable()
class WorkoutDto {
  final String id;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'week_id')
  final String weekId;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  final String title;
  final String? content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  // Nested program week info (from query)
  final ProgramWeeksDto? programWeeks;

  // Nested program info (from query)
  final ProgramDto? program;

  WorkoutDto({
    required this.id,
    required this.programId,
    required this.weekId,
    required this.dayNumber,
    required this.title,
    this.content,
    required this.createdAt,
    this.programWeeks,
    this.program,
  });

  factory WorkoutDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutDtoToJson(this);

  WorkoutEntity toEntity() => WorkoutEntity.fromDto(this);
}

// Program week DTO (from program_weeks table)
@JsonSerializable()
class ProgramWeeksDto {
  final String id;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'week_number')
  final int weekNumber;
  final String title;
  final String? description;

  // Nested workouts with sessions
  final List<WorkoutsNestedDto>? workouts;

  ProgramWeeksDto({
    required this.id,
    required this.programId,
    required this.weekNumber,
    required this.title,
    this.description,
    this.workouts,
  });

  factory ProgramWeeksDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramWeeksDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramWeeksDtoToJson(this);

  ProgramWeekEntity toEntity() => ProgramWeekEntity.fromDto(this);
}

// Nested workout DTO (from workouts table with sessions)
@JsonSerializable()
class WorkoutsNestedDto {
  final String id;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'week_id')
  final String weekId;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  final String title;
  final String? content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  // Nested sessions
  @JsonKey(name: 'workout_sessions')
  final List<WorkoutSessionsDto>? workoutSessions;

  WorkoutsNestedDto({
    required this.id,
    required this.programId,
    required this.weekId,
    required this.dayNumber,
    required this.title,
    this.content,
    required this.createdAt,
    this.workoutSessions,
  });

  factory WorkoutsNestedDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutsNestedDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutsNestedDtoToJson(this);
}

// Workout session DTO (from workout_sessions table)
@JsonSerializable()
class WorkoutSessionsDto {
  final String id;
  @JsonKey(name: 'workout_id')
  final String workoutId;
  final String title;
  final String? content;
  @JsonKey(name: 'order_index')
  final int orderIndex;

  WorkoutSessionsDto({
    required this.id,
    required this.workoutId,
    required this.title,
    this.content,
    required this.orderIndex,
  });

  factory WorkoutSessionsDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutSessionsDtoToJson(this);
}
