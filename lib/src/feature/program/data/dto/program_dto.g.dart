// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoachProfileDto _$CoachProfileDtoFromJson(Map<String, dynamic> json) =>
    CoachProfileDto(
      id: json['id'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      nickname: json['nickname'] as String?,
    );

Map<String, dynamic> _$CoachProfileDtoToJson(CoachProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'profile_image_url': instance.profileImageUrl,
      'nickname': instance.nickname,
    };

CurriculumItemDto _$CurriculumItemDtoFromJson(Map<String, dynamic> json) =>
    CurriculumItemDto(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CurriculumItemDtoToJson(CurriculumItemDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

ProgramDto _$ProgramDtoFromJson(Map<String, dynamic> json) => ProgramDto(
  id: json['id'] as String,
  coachId: json['coach_id'] as String,
  title: json['title'] as String,
  slug: json['slug'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
  isPublic: json['is_public'] as bool,
  isForSale: json['is_for_sale'] as bool,
  price: json['price'],
  accessPeriodDays: (json['access_period_days'] as num?)?.toInt(),
  difficulty: json['difficulty'] as String,
  durationWeeks: (json['duration_weeks'] as num).toInt(),
  daysPerWeek: (json['days_per_week'] as num).toInt(),
  mainImageList: (json['main_image_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  programImage: json['program_image'] as String?,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
  endDate: json['end_date'] == null
      ? null
      : DateTime.parse(json['end_date'] as String),
  curriculum: const CurriculumConverter().fromJson(json['curriculum']),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProgramDtoToJson(ProgramDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'title': instance.title,
      'slug': instance.slug,
      'type': instance.type,
      'description': instance.description,
      'is_public': instance.isPublic,
      'is_for_sale': instance.isForSale,
      'price': instance.price,
      'access_period_days': instance.accessPeriodDays,
      'difficulty': instance.difficulty,
      'duration_weeks': instance.durationWeeks,
      'days_per_week': instance.daysPerWeek,
      'main_image_list': instance.mainImageList,
      'program_image': instance.programImage,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'curriculum': const CurriculumConverter().toJson(instance.curriculum),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

ProgramWithCoachDto _$ProgramWithCoachDtoFromJson(Map<String, dynamic> json) =>
    ProgramWithCoachDto(
      id: json['id'] as String,
      coachId: json['coach_id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      type: json['type'] as String,
      description: json['description'] as String?,
      isPublic: json['is_public'] as bool,
      isForSale: json['is_for_sale'] as bool,
      price: json['price'] as num,
      accessPeriodDays: (json['access_period_days'] as num?)?.toInt(),
      difficulty: json['difficulty'] as String,
      durationWeeks: (json['duration_weeks'] as num).toInt(),
      daysPerWeek: (json['days_per_week'] as num).toInt(),
      mainImageList: (json['main_image_list'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      programImage: json['program_image'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      curriculum: const CurriculumConverter().fromJson(json['curriculum']),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      coach: const NestedCoachProfileConverter().fromJson(json['account']),
    );

Map<String, dynamic> _$ProgramWithCoachDtoToJson(
  ProgramWithCoachDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'coach_id': instance.coachId,
  'title': instance.title,
  'slug': instance.slug,
  'type': instance.type,
  'description': instance.description,
  'is_public': instance.isPublic,
  'is_for_sale': instance.isForSale,
  'price': instance.price,
  'access_period_days': instance.accessPeriodDays,
  'difficulty': instance.difficulty,
  'duration_weeks': instance.durationWeeks,
  'days_per_week': instance.daysPerWeek,
  'main_image_list': instance.mainImageList,
  'program_image': instance.programImage,
  'start_date': instance.startDate?.toIso8601String(),
  'end_date': instance.endDate?.toIso8601String(),
  'curriculum': const CurriculumConverter().toJson(instance.curriculum),
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'account': const NestedCoachProfileConverter().toJson(instance.coach),
};
