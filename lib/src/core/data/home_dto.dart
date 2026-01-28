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
