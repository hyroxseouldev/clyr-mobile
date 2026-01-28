import 'package:clyr_mobile/src/core/data/dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_dto.g.dart';

/// Active program data with enrollment and coach information
/// Used by getCurrentActiveProgram in data_source.dart
@JsonSerializable(explicitToJson: true)
class ActiveProgramDto {
  // Program fields
  final String id;
  final String coachId;
  final String title;
  final String? description;
  final String? programImage;
  final List<String>? mainImageList;

  // Enrollment fields
  final DateTime? startDate;
  final DateTime? endDate;

  // Coach profile fields
  final String? coachProfileUrl;
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
  final List<BlueprintSectionItemsDto> sections;
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
