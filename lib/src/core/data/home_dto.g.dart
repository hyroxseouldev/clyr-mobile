// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlattenBlueprintSectionItemsDto _$FlattenBlueprintSectionItemsDtoFromJson(
  Map<String, dynamic> json,
) => FlattenBlueprintSectionItemsDto(
  id: json['id'] as String,
  blueprintId: json['blueprint_id'] as String,
  sectionId: json['section_id'] as String,
  orderIndex: (json['order_index'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  sectionTitle: json['section_title'] as String,
  sectionContent: json['section_content'] as String,
  sectionRecordType: json['section_record_type'] as String?,
  sectionIsRecordable: json['section_is_recordable'] as bool?,
  isCompleted: json['is_completed'] as bool,
);

Map<String, dynamic> _$FlattenBlueprintSectionItemsDtoToJson(
  FlattenBlueprintSectionItemsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'blueprint_id': instance.blueprintId,
  'section_id': instance.sectionId,
  'order_index': instance.orderIndex,
  'created_at': instance.createdAt.toIso8601String(),
  'section_title': instance.sectionTitle,
  'section_content': instance.sectionContent,
  'section_record_type': instance.sectionRecordType,
  'section_is_recordable': instance.sectionIsRecordable,
  'is_completed': instance.isCompleted,
};

ActiveProgramDto _$ActiveProgramDtoFromJson(Map<String, dynamic> json) =>
    ActiveProgramDto(
      id: json['id'] as String,
      coachId: json['coach_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      programImage: json['program_image'] as String?,
      mainImageList: (json['main_image_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      coachProfileUrl: json['coach_profile_url'] as String?,
      coachName: json['coach_name'] as String?,
    );

Map<String, dynamic> _$ActiveProgramDtoToJson(ActiveProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'title': instance.title,
      'description': instance.description,
      'program_image': instance.programImage,
      'main_image_list': instance.mainImageList,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'coach_profile_url': instance.coachProfileUrl,
      'coach_name': instance.coachName,
    };

TodaysSessionDto _$TodaysSessionDtoFromJson(Map<String, dynamic> json) =>
    TodaysSessionDto(
      sections: (json['sections'] as List<dynamic>)
          .map(
            (e) => FlattenBlueprintSectionItemsDto.fromJson(
              e as Map<String, dynamic>,
            ),
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
