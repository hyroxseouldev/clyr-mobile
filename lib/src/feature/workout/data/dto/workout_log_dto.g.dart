// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutLogDto _$WorkoutLogDtoFromJson(Map<String, dynamic> json) =>
    WorkoutLogDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      logDate: DateTime.parse(json['log_date'] as String),
      content: json['content'] as Map<String, dynamic>,
      intensity: json['intensity'] as String,
      programId: json['program_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutLogDtoToJson(WorkoutLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'log_date': instance.logDate.toIso8601String(),
      'content': instance.content,
      'intensity': instance.intensity,
      'program_id': instance.programId,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
