import 'package:json_annotation/json_annotation.dart';

part 'program_dto.g.dart';

/// Converter to handle curriculum JSONB array
/// Converts null or empty arrays to empty list
class CurriculumConverter
    implements JsonConverter<List<CurriculumItemDto>?, dynamic> {
  const CurriculumConverter();

  @override
  List<CurriculumItemDto>? fromJson(dynamic json) {
    if (json == null) return [];
    if (json is List) {
      return json
          .map(
            (item) =>
                CurriculumItemDto.fromJson(Map<String, dynamic>.from(item)),
          )
          .toList();
    }
    return [];
  }

  @override
  dynamic toJson(List<CurriculumItemDto>? object) => object;
}

/// Converter to extract coach_profile from nested account structure
/// Handles: programs → account → coach_profile
class NestedCoachProfileConverter
    implements JsonConverter<CoachProfileDto?, dynamic> {
  const NestedCoachProfileConverter();

  @override
  CoachProfileDto? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is List && json.isEmpty) return null;

    if (json is Map) {
      final map = Map<String, dynamic>.from(json);

      if (map.containsKey('nickname')) {
        return CoachProfileDto.fromJson(map);
      }

      if (map.containsKey('coach_profile')) {
        final coachProfile = map['coach_profile'];
        if (coachProfile == null) return null;
        if (coachProfile is List && coachProfile.isEmpty) return null;
        if (coachProfile is Map) {
          return CoachProfileDto.fromJson(
            Map<String, dynamic>.from(coachProfile),
          );
        }
      }
    }
    return null;
  }

  @override
  dynamic toJson(CoachProfileDto? object) => object?.toJson();
}

/// Coach profile DTO for program
/// Feature-scoped to avoid dependency on core layer
@JsonSerializable()
class CoachProfileDto {
  final String id;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  final String? nickname;

  CoachProfileDto({required this.id, this.profileImageUrl, this.nickname});

  factory CoachProfileDto.fromJson(Map<String, dynamic> json) =>
      _$CoachProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoachProfileDtoToJson(this);
}

/// Curriculum item DTO for program
@JsonSerializable()
class CurriculumItemDto {
  final String title;
  final String description;

  CurriculumItemDto({required this.title, required this.description});

  factory CurriculumItemDto.fromJson(Map<String, dynamic> json) =>
      _$CurriculumItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CurriculumItemDtoToJson(this);
}

/// Program data transfer object
@JsonSerializable()
class ProgramDto {
  final String id;
  @JsonKey(name: 'coach_id')
  final String coachId;
  final String title;
  final String slug;
  final String type;
  final String? description;
  @JsonKey(name: 'is_public')
  final bool isPublic;
  @JsonKey(name: 'is_for_sale')
  final bool isForSale;
  final dynamic price;
  @JsonKey(name: 'access_period_days')
  final int? accessPeriodDays;
  final String difficulty;
  @JsonKey(name: 'duration_weeks')
  final int durationWeeks;
  @JsonKey(name: 'days_per_week')
  final int daysPerWeek;
  @JsonKey(name: 'main_image_list')
  final List<String>? mainImageList;
  @JsonKey(name: 'program_image')
  final String? programImage;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @CurriculumConverter()
  @JsonKey(name: 'curriculum')
  final List<CurriculumItemDto>? curriculum;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  ProgramDto({
    required this.id,
    required this.coachId,
    required this.title,
    required this.slug,
    required this.type,
    this.description,
    required this.isPublic,
    required this.isForSale,
    required dynamic this.price,
    this.accessPeriodDays,
    required this.difficulty,
    required this.durationWeeks,
    required this.daysPerWeek,
    this.mainImageList,
    this.programImage,
    this.startDate,
    this.endDate,
    this.curriculum,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProgramDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramDtoToJson(this);
}

/// Program with nested coach profile
/// Used for Supabase queries that fetch coach data in single request
@JsonSerializable()
class ProgramWithCoachDto {
  final String id;
  @JsonKey(name: 'coach_id')
  final String coachId;
  final String title;
  final String slug;
  final String type;
  final String? description;
  @JsonKey(name: 'is_public')
  final bool isPublic;
  @JsonKey(name: 'is_for_sale')
  final bool isForSale;
  final num price;
  @JsonKey(name: 'access_period_days')
  final int? accessPeriodDays;
  final String difficulty;
  @JsonKey(name: 'duration_weeks')
  final int durationWeeks;
  @JsonKey(name: 'days_per_week')
  final int daysPerWeek;
  @JsonKey(name: 'main_image_list')
  final List<String>? mainImageList;
  @JsonKey(name: 'program_image')
  final String? programImage;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @CurriculumConverter()
  @JsonKey(name: 'curriculum')
  final List<CurriculumItemDto>? curriculum;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  /// Nested coach profile from account → coach_profile
  @NestedCoachProfileConverter()
  @JsonKey(name: 'account')
  final CoachProfileDto? coach;

  ProgramWithCoachDto({
    required this.id,
    required this.coachId,
    required this.title,
    required this.slug,
    required this.type,
    this.description,
    required this.isPublic,
    required this.isForSale,
    required this.price,
    this.accessPeriodDays,
    required this.difficulty,
    required this.durationWeeks,
    required this.daysPerWeek,
    this.mainImageList,
    this.programImage,
    this.startDate,
    this.endDate,
    this.curriculum,
    required this.createdAt,
    required this.updatedAt,
    this.coach,
  });

  factory ProgramWithCoachDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramWithCoachDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramWithCoachDtoToJson(this);
}
