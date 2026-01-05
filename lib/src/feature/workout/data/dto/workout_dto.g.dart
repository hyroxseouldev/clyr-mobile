// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramDto _$ProgramDtoFromJson(Map<String, dynamic> json) => ProgramDto(
  id: json['id'] as String,
  name: json['name'] as String,
  thumbnailUrl: json['thumbnail_url'] as String?,
  description: json['description'] as String?,
  shortDescription: json['short_description'] as String?,
);

Map<String, dynamic> _$ProgramDtoToJson(ProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail_url': instance.thumbnailUrl,
      'description': instance.description,
      'short_description': instance.shortDescription,
    };

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) => WorkoutDto(
  id: json['id'] as String,
  programId: json['program_id'] as String,
  weekId: json['week_id'] as String,
  dayNumber: (json['day_number'] as num).toInt(),
  title: json['title'] as String,
  content: json['content'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  programWeeks: json['programWeeks'] == null
      ? null
      : ProgramWeeksDto.fromJson(json['programWeeks'] as Map<String, dynamic>),
  program: json['program'] == null
      ? null
      : ProgramDto.fromJson(json['program'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WorkoutDtoToJson(WorkoutDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'week_id': instance.weekId,
      'day_number': instance.dayNumber,
      'title': instance.title,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'programWeeks': instance.programWeeks,
      'program': instance.program,
    };

ProgramWeeksDto _$ProgramWeeksDtoFromJson(Map<String, dynamic> json) =>
    ProgramWeeksDto(
      id: json['id'] as String,
      programId: json['program_id'] as String,
      weekNumber: (json['week_number'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      workouts: (json['workouts'] as List<dynamic>?)
          ?.map((e) => WorkoutsNestedDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProgramWeeksDtoToJson(ProgramWeeksDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'week_number': instance.weekNumber,
      'title': instance.title,
      'description': instance.description,
      'workouts': instance.workouts,
    };

WorkoutsNestedDto _$WorkoutsNestedDtoFromJson(Map<String, dynamic> json) =>
    WorkoutsNestedDto(
      id: json['id'] as String,
      programId: json['program_id'] as String,
      weekId: json['week_id'] as String,
      dayNumber: (json['day_number'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      workoutSessions: (json['workout_sessions'] as List<dynamic>?)
          ?.map((e) => WorkoutSessionsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkoutsNestedDtoToJson(WorkoutsNestedDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program_id': instance.programId,
      'week_id': instance.weekId,
      'day_number': instance.dayNumber,
      'title': instance.title,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'workout_sessions': instance.workoutSessions,
    };

WorkoutSessionsDto _$WorkoutSessionsDtoFromJson(Map<String, dynamic> json) =>
    WorkoutSessionsDto(
      id: json['id'] as String,
      workoutId: json['workout_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String?,
      orderIndex: (json['order_index'] as num).toInt(),
    );

Map<String, dynamic> _$WorkoutSessionsDtoToJson(WorkoutSessionsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workout_id': instance.workoutId,
      'title': instance.title,
      'content': instance.content,
      'order_index': instance.orderIndex,
    };
