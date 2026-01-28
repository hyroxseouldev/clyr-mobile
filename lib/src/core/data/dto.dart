import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/order_entity.dart';

part 'dto.g.dart';

// =============================================================
// 1. IDENTITY & PROFILES (누가 사용하는가)
// =============================================================

/// [Account] 기본 계정 정보
@JsonSerializable()
class AccountDto {
  final String id;
  final String email;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final String? role;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  AccountDto({
    required this.id,
    required this.email,
    this.fullName,
    this.role,
    this.avatarUrl,
    required this.createdAt,
  });

  factory AccountDto.fromJson(Map<String, dynamic> json) =>
      _$AccountDtoFromJson(json);
  Map<String, dynamic> toJson() => _$AccountDtoToJson(this);
}

/// [CoachProfile] 코치 전용 상세 메타데이터
@JsonSerializable()
class CoachProfileDto {
  final String id;
  @JsonKey(name: 'account_id')
  final String accountId;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  final String? nickname;
  final String? introduction;
  final String? experience;
  final List<String>? certifications;
  @JsonKey(name: 'contact_number')
  final String? contactNumber;
  @JsonKey(name: 'sns_links')
  final Map<String, dynamic>? snsLinks;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  CoachProfileDto({
    required this.id,
    required this.accountId,
    this.profileImageUrl,
    this.nickname,
    this.introduction,
    this.experience,
    this.certifications,
    this.contactNumber,
    this.snsLinks,
    required this.updatedAt,
  });

  factory CoachProfileDto.fromJson(Map<String, dynamic> json) {
    // Handle Supabase jsonb array quirks for certifications
    List<String>? certs;
    if (json['certifications'] != null) {
      if (json['certifications'] is List) {
        certs = (json['certifications'] as List)
            .map((e) => e.toString())
            .toList();
      }
    }

    return CoachProfileDto(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      profileImageUrl: json['profile_image_url'] as String?,
      nickname: json['nickname'] as String?,
      introduction: json['introduction'] as String?,
      experience: json['experience'] as String?,
      certifications: certs,
      contactNumber: json['contact_number'] as String?,
      snsLinks: json['sns_links'] as Map<String, dynamic>?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => _$CoachProfileDtoToJson(this);
}

/// [UserProfile] 일반 사용자용 프로필
@JsonSerializable()
class UserProfileDto {
  final String id;
  @JsonKey(name: 'account_id')
  final String? accountId;
  final String? nickname;
  final String? bio;
  @JsonKey(name: 'profile_image_url')
  final String? profileImageUrl;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  @JsonKey(name: 'fitness_goals')
  final List<String>? fitnessGoals;
  @JsonKey(name: 'fitness_level')
  final String? fitnessLevel;
  @JsonKey(name: 'onboarding_completed')
  final bool? onboardingCompleted;
  @JsonKey(name: 'onboarding_data')
  final Map<String, dynamic>? onboardingData;
  @JsonKey(name: 'onboarding_completed_at')
  final DateTime? onboardingCompletedAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  UserProfileDto({
    required this.id,
    required this.accountId,
    this.nickname,
    this.bio,
    this.profileImageUrl,
    this.phoneNumber,
    this.fitnessGoals,
    this.fitnessLevel,
    this.onboardingCompleted,
    this.onboardingData,
    this.onboardingCompletedAt,
    required this.updatedAt,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    List<String>? goals;
    if (json['fitness_goals'] != null) {
      if (json['fitness_goals'] is List) {
        goals = (json['fitness_goals'] as List)
            .map((e) => e.toString())
            .toList();
      }
    }

    return UserProfileDto(
      id: json['id'] as String,
      accountId: json['account_id'] as String?,
      nickname: json['nickname'] as String?,
      bio: json['bio'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fitnessGoals: goals,
      fitnessLevel: json['fitness_level'] as String?,
      onboardingCompleted: json['onboarding_completed'] as bool?,
      onboardingData: json['onboarding_data'] as Map<String, dynamic>?,
      onboardingCompletedAt: json['onboarding_completed_at'] != null
          ? DateTime.parse(json['onboarding_completed_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  UserProfileEntity toEntity() => UserProfileEntity.fromDto(this);
}

// =============================================================
// 2. WORKOUT ASSETS (무엇을 운동하는가)
// =============================================================

@JsonSerializable()
class WorkoutLibraryDto {
  final String id;
  @JsonKey(name: 'coach_id')
  final String? coachId;
  final String title;
  final String? category;
  @JsonKey(name: 'workout_type')
  final String? workoutType;
  @JsonKey(name: 'video_url')
  final String? videoUrl;
  final String? description;
  @JsonKey(name: 'is_system')
  final bool? isSystem;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  WorkoutLibraryDto({
    required this.id,
    this.coachId,
    required this.title,
    this.category,
    this.workoutType,
    this.videoUrl,
    this.description,
    this.isSystem,
    required this.createdAt,
    required this.updatedAt,
  });

  factory WorkoutLibraryDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLibraryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutLibraryDtoToJson(this);
}

// =============================================================
// 3. PROGRAM (어떻게 설계하는가)
// =============================================================

/// [Programs] 운동 프로그램 (판매 상품 정보)
@JsonSerializable()
class ProgramsDto {
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
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  ProgramsDto({
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
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProgramsDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramsDtoToJson(this);
}

@JsonSerializable()
class ProgramBlueprintsDto {
  final String id;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'phase_number')
  final int phaseNumber;
  @JsonKey(name: 'day_number')
  final int dayNumber;
  @JsonKey(name: 'day_title')
  final String? dayTitle;
  final String? notes;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  ProgramBlueprintsDto({
    required this.id,
    required this.programId,
    required this.phaseNumber,
    required this.dayNumber,
    this.dayTitle,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProgramBlueprintsDto.fromJson(Map<String, dynamic> json) =>
      _$ProgramBlueprintsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ProgramBlueprintsDtoToJson(this);
}

/// [blueprintSections] Sections for blueprint content
@JsonSerializable()
class BlueprintSectionsDto {
  final String id;
  final String title;
  final String content;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  BlueprintSectionsDto({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BlueprintSectionsDto.fromJson(Map<String, dynamic> json) =>
      _$BlueprintSectionsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$BlueprintSectionsDtoToJson(this);
}

/// [blueprintSectionItems] Join table linking sections to blueprints
@JsonSerializable()
class BlueprintSectionItemsDto {
  final String id;
  @JsonKey(name: 'blueprint_id')
  final String blueprintId;
  @JsonKey(name: 'section_id')
  final String sectionId;
  @JsonKey(name: 'order_index')
  final int orderIndex;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  // Nested section data from Supabase query (ignored in serialization)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final BlueprintSectionsDto? blueprintSection;
  // Nested section record from Supabase query (if completed)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final SectionRecordDto? sectionRecord;

  BlueprintSectionItemsDto({
    required this.id,
    required this.blueprintId,
    required this.sectionId,
    required this.orderIndex,
    required this.createdAt,
    this.blueprintSection,
    this.sectionRecord,
  });

  factory BlueprintSectionItemsDto.fromJson(Map<String, dynamic> json) {
    try {
      // Extract nested blueprint_sections
      BlueprintSectionsDto? section;
      if (json['blueprint_sections'] != null &&
          json['blueprint_sections'] is Map) {
        section = BlueprintSectionsDto.fromJson(
          json['blueprint_sections'] as Map<String, dynamic>,
        );
      }

      // Extract nested section_records (filter by current user if multiple)
      SectionRecordDto? record;
      if (json['section_records'] != null) {
        final recordsData = json['section_records'];
        // Handle both single object and array
        if (recordsData is Map) {
          record = SectionRecordDto.fromJson(
            recordsData as Map<String, dynamic>,
          );
        } else if (recordsData is List && recordsData.isNotEmpty) {
          print('recordsData: $recordsData');

          // Filter by current user's session records (we'd need userId here, but for now take first)
          record = SectionRecordDto.fromJson(
            recordsData[0] as Map<String, dynamic>,
          );
        }
      }

      // Safely parse order_index (handle both int and String from Supabase)
      final orderIndexValue = json['order_index'];
      final int orderIndex;
      if (orderIndexValue is int) {
        orderIndex = orderIndexValue;
      } else if (orderIndexValue is String) {
        orderIndex = int.parse(orderIndexValue);
      } else if (orderIndexValue is double) {
        orderIndex = orderIndexValue.toInt();
      } else if (orderIndexValue is num) {
        orderIndex = orderIndexValue.toInt();
      } else {
        print(
          'Warning: order_index has unexpected type: ${orderIndexValue.runtimeType}, value: $orderIndexValue',
        );
        orderIndex = 0; // fallback
      }

      return BlueprintSectionItemsDto(
        id: json['id'] as String,
        blueprintId: json['blueprint_id'] as String,
        sectionId: json['section_id'] as String,
        orderIndex: orderIndex,
        createdAt: DateTime.parse(json['created_at'] as String),
        blueprintSection: section,
        sectionRecord: record,
      );
    } catch (e) {
      print('Error parsing BlueprintSectionItemsDto: $e');
      print('JSON data: $json');
      rethrow;
    }
  }

  Map<String, dynamic> toJson() => _$BlueprintSectionItemsDtoToJson(this);
}

// =============================================================
// 4. 상거래 및 수강 권한 (Commerce & Access)
// =============================================================

/// [WorkoutLogs] 사용자 운동 기록
@JsonSerializable()
class WorkoutLogsDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'library_id')
  final String libraryId;
  @JsonKey(name: 'blueprint_id')
  final String? blueprintId;
  @JsonKey(name: 'log_date')
  final DateTime logDate;
  final Map<String, dynamic>? content;
  final String? intensity;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @JsonKey(name: 'max_weight')
  final String? maxWeight;
  @JsonKey(name: 'total_volume')
  final String? totalVolume;
  @JsonKey(name: 'total_duration')
  final int? totalDuration;
  @JsonKey(name: 'coach_comment')
  final String? coachComment;
  @JsonKey(name: 'is_checked_by_coach')
  final bool? isCheckedByCoach;

  WorkoutLogsDto({
    required this.id,
    required this.userId,
    required this.libraryId,
    this.blueprintId,
    required this.logDate,
    this.content,
    this.intensity,
    required this.createdAt,
    required this.updatedAt,
    this.maxWeight,
    this.totalVolume,
    this.totalDuration,
    this.coachComment,
    this.isCheckedByCoach,
  });

  factory WorkoutLogsDto.fromJson(Map<String, dynamic> json) =>
      _$WorkoutLogsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WorkoutLogsDtoToJson(this);
}

/// [Orders] 결제 내역
@JsonSerializable()
class OrdersDto {
  final String id;
  @JsonKey(name: 'buyer_id')
  final String buyerId;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'coach_id')
  final String coachId;
  final String? amount;
  final String? status;
  @JsonKey(name: 'payment_key')
  final String? paymentKey;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  OrdersDto({
    required this.id,
    required this.buyerId,
    required this.programId,
    required this.coachId,
    this.amount,
    this.status,
    this.paymentKey,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrdersDto.fromJson(Map<String, dynamic> json) =>
      _$OrdersDtoFromJson(json);
  Map<String, dynamic> toJson() => _$OrdersDtoToJson(this);

  OrderEntity toEntity() => OrderEntity.fromDto(this);
}

/// [Enrollments] 실제 수강 권한
@JsonSerializable()
class EnrollmentsDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'program_id')
  final String programId;
  @JsonKey(name: 'order_id')
  final String? orderId;
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  EnrollmentsDto({
    required this.id,
    required this.userId,
    required this.programId,
    this.orderId,
    this.startDate,
    this.endDate,
    this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EnrollmentsDto.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$EnrollmentsDtoToJson(this);

  EnrollmentEntity toEntity() => EnrollmentEntity.fromDto(this);
}

/// [SectionRecord] 섹션 완료 기록
@JsonSerializable()
class SectionRecordDto {
  final String id;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'user_profile_id')
  final String? userProfileId;
  @JsonKey(name: 'section_id')
  final String sectionId;
  @JsonKey(name: 'section_item_id')
  final String sectionItemId;
  final Map<String, dynamic>? content;
  @JsonKey(name: 'completed_at')
  final DateTime completedAt;
  @JsonKey(name: 'coach_comment')
  final String? coachComment;
  @JsonKey(name: 'record_type')
  final String? recordType;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  // Nested user profile from Supabase query (ignored in serialization)
  @JsonKey(includeFromJson: false, includeToJson: false)
  final UserProfileDto? userProfile;

  SectionRecordDto({
    required this.id,
    required this.userId,
    required this.userProfileId,
    required this.sectionId,
    required this.sectionItemId,
    this.content,
    required this.completedAt,
    this.coachComment,
    this.recordType,
    required this.createdAt,
    required this.updatedAt,
    this.userProfile,
  });

  factory SectionRecordDto.fromJson(Map<String, dynamic> json) {
    // Extract nested user_profile (now directly accessible via user_profile_id join)
    UserProfileDto? profile;
    if (json['user_profile'] != null && json['user_profile'] is Map) {
      print('userProfile: ${json['user_profile']}');
      profile = UserProfileDto.fromJson(
        json['user_profile'] as Map<String, dynamic>,
      );
    }
    print('userProfile Started');

    // Handle userProfileId - may not be present in older queries
    String? userProfileId;
    if (json['user_profile_id'] != null) {
      userProfileId = json['user_profile_id'] as String?;
    }
    print('userProfile Completed');

    return SectionRecordDto(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      userProfileId: userProfileId ?? '',
      sectionId: json['section_id'] as String,
      sectionItemId: json['section_item_id'] as String,
      content: json['content'] as Map<String, dynamic>?,
      completedAt: DateTime.parse(json['completed_at'] as String),
      coachComment: json['coach_comment'] as String?,
      recordType: json['record_type'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      userProfile: profile,
    );
  }

  Map<String, dynamic> toJson() => _$SectionRecordDtoToJson(this);
}
