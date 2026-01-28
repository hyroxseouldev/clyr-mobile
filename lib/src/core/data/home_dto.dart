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
  @JsonKey(name: 'section_title')
  final String sectionTitle;
  @JsonKey(name: 'section_content')
  final String sectionContent;
  @JsonKey(name: 'section_record_type')
  final String? sectionRecordType;
  @JsonKey(name: 'section_is_recordable')
  final bool? sectionIsRecordable;

  // Completion status
  @JsonKey(name: 'is_completed')
  final bool isCompleted;

  FlattenBlueprintSectionItemsDto({
    required this.id,
    required this.blueprintId,
    required this.sectionId,
    required this.orderIndex,
    required this.createdAt,
    required this.sectionTitle,
    required this.sectionContent,
    this.sectionRecordType,
    this.sectionIsRecordable,
    required this.isCompleted,
  });

  factory FlattenBlueprintSectionItemsDto.fromJson(Map<String, dynamic> json) {
    // Extract blueprint_sections nested data
    String sectionTitle = '';
    String sectionContent = '';
    String? sectionRecordType;
    bool? sectionIsRecordable;

    final section = json['blueprint_sections'];
    if (section != null && section is Map) {
      final sectionData = section as Map<String, dynamic>;
      if (sectionData['title'] != null && sectionData['title'] is String) {
        sectionTitle = sectionData['title'] as String;
      }
      if (sectionData['content'] != null && sectionData['content'] is String) {
        sectionContent = sectionData['content'] as String;
      }
      if (sectionData['record_type'] != null && sectionData['record_type'] is String) {
        sectionRecordType = sectionData['record_type'] as String;
      }
      if (sectionData['is_recordable'] != null && sectionData['is_recordable'] is bool) {
        sectionIsRecordable = sectionData['is_recordable'] as bool;
      }
    }

    // Check isCompleted: use pre-computed value or check section_records
    bool isCompleted = false;
    if (json['_is_completed'] case bool completed) {
      isCompleted = completed;
    } else {
      final records = json['section_records'];
      if (records != null && records is List) {
        isCompleted = records.isNotEmpty;
      }
    }

    // Create flattened JSON for auto-generated serializer
    final flattenedJson = {
      'id': json['id'],
      'blueprint_id': json['blueprint_id'],
      'section_id': json['section_id'],
      'order_index': json['order_index'],
      'created_at': json['created_at'],
      'section_title': sectionTitle,
      'section_content': sectionContent,
      'section_record_type': sectionRecordType,
      'section_is_recordable': sectionIsRecordable,
      'is_completed': isCompleted,
    };

    return _$FlattenBlueprintSectionItemsDtoFromJson(flattenedJson);
  }

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
