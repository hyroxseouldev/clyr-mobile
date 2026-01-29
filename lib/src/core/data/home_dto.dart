import 'package:json_annotation/json_annotation.dart';

part 'home_dto.g.dart';

/// Flattened DTO for blueprint section items with section data and completion status
/// Avoids nested type casting issues from Supabase queries
@JsonSerializable()
class FlattenBlueprintSectionItemsDto {
  // BlueprintSectionItems fields
  final String id;
  @JsonKey(name: 'blueprint_id')
  final String blueprintId;
  @JsonKey(name: 'section_id')
  final String sectionId;
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  // BlueprintSections fields (flattened)
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'content')
  final String content;
  @JsonKey(name: 'record_type')
  final String? recordType;
  @JsonKey(name: 'is_recordable')
  final bool? isRecordable;

  // Completion status
  @JsonKey(name: 'is_completed')
  final bool isCompleted;

  FlattenBlueprintSectionItemsDto({
    required this.id,
    required this.blueprintId,
    required this.sectionId,
    required this.orderIndex,
    required this.createdAt,
    required this.title,
    required this.content,
    this.recordType,
    this.isRecordable,
    required this.isCompleted,
  });

  factory FlattenBlueprintSectionItemsDto.fromJson(Map<String, dynamic> json) =>
      _$FlattenBlueprintSectionItemsDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FlattenBlueprintSectionItemsDtoToJson(this);
}

/// Active program data with enrollment and coach information
/// Used by getCurrentActiveProgram in data_source.dart
@JsonSerializable(explicitToJson: true)
class ActiveProgramDto {
  // Program fields
  final String id;
  @JsonKey(name: 'coach_id')
  final String coachId;
  final String title;
  final String? description;
  @JsonKey(name: 'program_image')
  final String? programImage;
  @JsonKey(name: 'main_image_list')
  final List<String>? mainImageList;

  // Enrollment fields
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;

  // Coach profile fields
  @JsonKey(name: 'coach_profile_url')
  final String? coachProfileUrl;
  @JsonKey(name: 'coach_name')
  final String? coachName;

  ActiveProgramDto({
    required this.id,
    required this.coachId,
    required this.title,
    this.description,
    this.programImage,
    this.mainImageList,
    this.startDate,
    this.endDate,
    this.coachProfileUrl,
    this.coachName,
  });

  factory ActiveProgramDto.fromJson(Map<String, dynamic> json) =>
      _$ActiveProgramDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ActiveProgramDtoToJson(this);
}

/// Today's session data with sections and coach message
/// Used by getTodaysSessionState in data_source.dart
@JsonSerializable(explicitToJson: true)
class TodaysSessionDto {
  final List<FlattenBlueprintSectionItemsDto> sections;
  final String notes;
  final String coachName;

  TodaysSessionDto({
    required this.sections,
    required this.notes,
    required this.coachName,
  });

  factory TodaysSessionDto.fromJson(Map<String, dynamic> json) =>
      _$TodaysSessionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodaysSessionDtoToJson(this);
}
