// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollmentDto _$EnrollmentDtoFromJson(Map<String, dynamic> json) =>
    EnrollmentDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      programId: json['program_id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$EnrollmentDtoToJson(EnrollmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'program_id': instance.programId,
      'start_date': instance.startDate.toIso8601String(),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
    };
