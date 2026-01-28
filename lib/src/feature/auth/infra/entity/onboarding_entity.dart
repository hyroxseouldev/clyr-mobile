import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_entity.freezed.dart';

/// Gender selection - matches database schema
enum Gender {
  @JsonValue('MALE') male,
  @JsonValue('FEMALE') female,
  @JsonValue('OTHER') other;

  String get value {
    switch (this) {
      case Gender.male:
        return 'MALE';
      case Gender.female:
        return 'FEMALE';
      case Gender.other:
        return 'OTHER';
    }
  }
}

/// Exercise type selection - matches database schema
enum ExerciseType {
  @JsonValue('HYROX') hyrox,
  @JsonValue('CROSSFIT') crossfit,
  @JsonValue('RUNNING') running,
  @JsonValue('GYM') gym,
  @JsonValue('OTHER') other;

  String get value {
    switch (this) {
      case ExerciseType.hyrox:
        return 'HYROX';
      case ExerciseType.crossfit:
        return 'CROSSFIT';
      case ExerciseType.running:
        return 'RUNNING';
      case ExerciseType.gym:
        return 'GYM';
      case ExerciseType.other:
        return 'OTHER';
    }
  }
}

/// Experience level selection
enum ExperienceLevel {
  @JsonValue('less_3m') less3m,
  @JsonValue('less_6m') less6m,
  @JsonValue('less_1y') less1y,
  @JsonValue('more_1y') more1y,
  @JsonValue('more_3y') more3y;

  String get value {
    switch (this) {
      case ExperienceLevel.less3m:
        return 'less_3m';
      case ExperienceLevel.less6m:
        return 'less_6m';
      case ExperienceLevel.less1y:
        return 'less_1y';
      case ExperienceLevel.more1y:
        return 'more_1y';
      case ExperienceLevel.more3y:
        return 'more_3y';
    }
  }
}

/// Onboarding data entity
@freezed
abstract class OnboardingEntity with _$OnboardingEntity {
  const factory OnboardingEntity({
    required Gender gender,
    required ExerciseType exerciseType,
    required ExperienceLevel experience,
  }) = _OnboardingEntity;

  const OnboardingEntity._();
}

/// Extension to convert OnboardingEntity to JSON
extension OnboardingEntityX on OnboardingEntity {
  /// Convert to JSON for storage - matches Drizzle schema
  Map<String, dynamic> toJson() {
    return {
      'gender': gender.value,
      'currentWorkoutType': exerciseType.value,
      'workoutExperience': experience.value,
    };
  }
}
