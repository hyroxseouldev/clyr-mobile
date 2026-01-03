// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutDto _$WorkoutDtoFromJson(Map<String, dynamic> json) => WorkoutDto(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  duration: (json['duration'] as num).toInt(),
  calories: (json['calories'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$WorkoutDtoToJson(WorkoutDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'calories': instance.calories,
      'createdAt': instance.createdAt.toIso8601String(),
    };
