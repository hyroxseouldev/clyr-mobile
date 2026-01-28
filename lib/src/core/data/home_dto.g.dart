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

TodaysSessionDto _$TodaysSessionDtoFromJson(Map<String, dynamic> json) =>
    TodaysSessionDto(
      sections: (json['sections'] as List<dynamic>)
          .map(
            (e) => BlueprintSectionItemsDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      notes: json['notes'] as String,
      coachName: json['coachName'] as String,
    );

Map<String, dynamic> _$TodaysSessionDtoToJson(TodaysSessionDto instance) =>
    <String, dynamic>{
      'sections': instance.sections.map((e) => e.toJson()).toList(),
      'notes': instance.notes,
      'coachName': instance.coachName,
    };
