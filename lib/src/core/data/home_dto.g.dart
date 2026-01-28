// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActiveProgramDto _$ActiveProgramDtoFromJson(Map<String, dynamic> json) =>
    ActiveProgramDto(
      id: json['id'] as String,
      coachId: json['coachId'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      programImage: json['programImage'] as String?,
      mainImageList: (json['mainImageList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      coachProfileUrl: json['coachProfileUrl'] as String?,
      coachName: json['coachName'] as String?,
    );

Map<String, dynamic> _$ActiveProgramDtoToJson(ActiveProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coachId': instance.coachId,
      'title': instance.title,
      'description': instance.description,
      'programImage': instance.programImage,
      'mainImageList': instance.mainImageList,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'coachProfileUrl': instance.coachProfileUrl,
      'coachName': instance.coachName,
    };
