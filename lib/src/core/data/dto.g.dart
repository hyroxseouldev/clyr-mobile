// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDto _$AccountDtoFromJson(Map<String, dynamic> json) => AccountDto(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String?,
  role: json['role'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AccountDtoToJson(AccountDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'full_name': instance.fullName,
      'role': instance.role,
      'avatar_url': instance.avatarUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };

CoachProfileDto _$CoachProfileDtoFromJson(Map<String, dynamic> json) =>
    CoachProfileDto(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      nickname: json['nickname'] as String?,
      introduction: json['introduction'] as String?,
      experience: json['experience'] as String?,
      certifications: (json['certifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      contactNumber: json['contact_number'] as String?,
      snsLinks: json['sns_links'] as Map<String, dynamic>?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CoachProfileDtoToJson(CoachProfileDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'profile_image_url': instance.profileImageUrl,
      'nickname': instance.nickname,
      'introduction': instance.introduction,
      'experience': instance.experience,
      'certifications': instance.certifications,
      'contact_number': instance.contactNumber,
      'sns_links': instance.snsLinks,
      'updated_at': instance.updatedAt.toIso8601String(),
    };

UserProfileDto _$UserProfileDtoFromJson(Map<String, dynamic> json) =>
    UserProfileDto(
      id: json['id'] as String,
      accountId: json['account_id'] as String?,
      nickname: json['nickname'] as String?,
      bio: json['bio'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fitnessGoals: (json['fitness_goals'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fitnessLevel: json['fitness_level'] as String?,
      onboardingCompleted: json['onboarding_completed'] as bool?,
      onboardingData: json['onboarding_data'] as Map<String, dynamic>?,
      onboardingCompletedAt: json['onboarding_completed_at'] == null
          ? null
          : DateTime.parse(json['onboarding_completed_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$UserProfileDtoToJson(
  UserProfileDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'account_id': instance.accountId,
  'nickname': instance.nickname,
  'bio': instance.bio,
  'profile_image_url': instance.profileImageUrl,
  'phone_number': instance.phoneNumber,
  'fitness_goals': instance.fitnessGoals,
  'fitness_level': instance.fitnessLevel,
  'onboarding_completed': instance.onboardingCompleted,
  'onboarding_data': instance.onboardingData,
  'onboarding_completed_at': instance.onboardingCompletedAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};

WorkoutLibraryDto _$WorkoutLibraryDtoFromJson(Map<String, dynamic> json) =>
    WorkoutLibraryDto(
      id: json['id'] as String,
      coachId: json['coach_id'] as String?,
      title: json['title'] as String,
      category: json['category'] as String?,
      workoutType: json['workout_type'] as String?,
      videoUrl: json['video_url'] as String?,
      description: json['description'] as String?,
      isSystem: json['is_system'] as bool?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$WorkoutLibraryDtoToJson(WorkoutLibraryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'title': instance.title,
      'category': instance.category,
      'workout_type': instance.workoutType,
      'video_url': instance.videoUrl,
      'description': instance.description,
      'is_system': instance.isSystem,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

ProgramsDto _$ProgramsDtoFromJson(Map<String, dynamic> json) => ProgramsDto(
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
  startDate: DateTime.parse(json['start_date'] as String),
  endDate: DateTime.parse(json['end_date'] as String),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProgramsDtoToJson(ProgramsDto instance) =>
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
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

ProgramBlueprintsDto _$ProgramBlueprintsDtoFromJson(
  Map<String, dynamic> json,
) => ProgramBlueprintsDto(
  id: json['id'] as String,
  programId: json['program_id'] as String,
  phaseNumber: (json['phase_number'] as num).toInt(),
  dayNumber: (json['day_number'] as num).toInt(),
  dayTitle: json['day_title'] as String?,
  notes: json['notes'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$ProgramBlueprintsDtoToJson(
  ProgramBlueprintsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'program_id': instance.programId,
  'phase_number': instance.phaseNumber,
  'day_number': instance.dayNumber,
  'day_title': instance.dayTitle,
  'notes': instance.notes,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

BlueprintSectionsDto _$BlueprintSectionsDtoFromJson(
  Map<String, dynamic> json,
) => BlueprintSectionsDto(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$BlueprintSectionsDtoToJson(
  BlueprintSectionsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

BlueprintSectionItemsDto _$BlueprintSectionItemsDtoFromJson(
  Map<String, dynamic> json,
) => BlueprintSectionItemsDto(
  id: json['id'] as String,
  blueprintId: json['blueprint_id'] as String,
  sectionId: json['section_id'] as String,
  orderIndex: (json['order_index'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$BlueprintSectionItemsDtoToJson(
  BlueprintSectionItemsDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'blueprint_id': instance.blueprintId,
  'section_id': instance.sectionId,
  'order_index': instance.orderIndex,
  'created_at': instance.createdAt.toIso8601String(),
};

WorkoutLogsDto _$WorkoutLogsDtoFromJson(Map<String, dynamic> json) =>
    WorkoutLogsDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      libraryId: json['library_id'] as String,
      blueprintId: json['blueprint_id'] as String?,
      logDate: DateTime.parse(json['log_date'] as String),
      content: json['content'] as Map<String, dynamic>?,
      intensity: json['intensity'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      maxWeight: json['max_weight'] as String?,
      totalVolume: json['total_volume'] as String?,
      totalDuration: (json['total_duration'] as num?)?.toInt(),
      coachComment: json['coach_comment'] as String?,
      isCheckedByCoach: json['is_checked_by_coach'] as bool?,
    );

Map<String, dynamic> _$WorkoutLogsDtoToJson(WorkoutLogsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'library_id': instance.libraryId,
      'blueprint_id': instance.blueprintId,
      'log_date': instance.logDate.toIso8601String(),
      'content': instance.content,
      'intensity': instance.intensity,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'max_weight': instance.maxWeight,
      'total_volume': instance.totalVolume,
      'total_duration': instance.totalDuration,
      'coach_comment': instance.coachComment,
      'is_checked_by_coach': instance.isCheckedByCoach,
    };

OrdersDto _$OrdersDtoFromJson(Map<String, dynamic> json) => OrdersDto(
  id: json['id'] as String,
  buyerId: json['buyer_id'] as String,
  programId: json['program_id'] as String,
  coachId: json['coach_id'] as String,
  amount: json['amount'] as String?,
  status: json['status'] as String?,
  paymentKey: json['payment_key'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$OrdersDtoToJson(OrdersDto instance) => <String, dynamic>{
  'id': instance.id,
  'buyer_id': instance.buyerId,
  'program_id': instance.programId,
  'coach_id': instance.coachId,
  'amount': instance.amount,
  'status': instance.status,
  'payment_key': instance.paymentKey,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};

EnrollmentsDto _$EnrollmentsDtoFromJson(Map<String, dynamic> json) =>
    EnrollmentsDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      programId: json['program_id'] as String,
      orderId: json['order_id'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      status: json['status'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EnrollmentsDtoToJson(EnrollmentsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'program_id': instance.programId,
      'order_id': instance.orderId,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

SectionRecordDto _$SectionRecordDtoFromJson(Map<String, dynamic> json) =>
    SectionRecordDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      userProfileId: json['user_profile_id'] as String?,
      sectionId: json['section_id'] as String,
      sectionItemId: json['section_item_id'] as String,
      content: json['content'] as Map<String, dynamic>?,
      completedAt: DateTime.parse(json['completed_at'] as String),
      coachComment: json['coach_comment'] as String?,
      recordType: json['record_type'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SectionRecordDtoToJson(SectionRecordDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_profile_id': instance.userProfileId,
      'section_id': instance.sectionId,
      'section_item_id': instance.sectionItemId,
      'content': instance.content,
      'completed_at': instance.completedAt.toIso8601String(),
      'coach_comment': instance.coachComment,
      'record_type': instance.recordType,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
