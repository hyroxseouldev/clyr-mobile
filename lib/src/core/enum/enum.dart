import 'package:freezed_annotation/freezed_annotation.dart';

/// 섹션 기록 유형
enum RecordType {
  @JsonValue('TIME_BASED')
  timeBased,
  @JsonValue('WEIGHT_BASED')
  weightBased,
  @JsonValue('REP_BASED')
  repBased,
  @JsonValue('DISTANCE_BASED')
  distanceBased,
  @JsonValue('SURVEY')
  survey,
  @JsonValue('CHECKLIST')
  checklist,
  @JsonValue('PHOTO')
  photo,
  @JsonValue('OTHER')
  other,
}

extension RecordTypeX on RecordType {
  String get value => switch (this) {
        RecordType.timeBased => 'TIME_BASED',
        RecordType.weightBased => 'WEIGHT_BASED',
        RecordType.repBased => 'REP_BASED',
        RecordType.distanceBased => 'DISTANCE_BASED',
        RecordType.survey => 'SURVEY',
        RecordType.checklist => 'CHECKLIST',
        RecordType.photo => 'PHOTO',
        RecordType.other => 'OTHER',
      };

  String get displayName => switch (this) {
        RecordType.timeBased => '시간 기반',
        RecordType.weightBased => '무게 기반',
        RecordType.repBased => '횟수 기반',
        RecordType.distanceBased => '거리 기반',
        RecordType.survey => '설문',
        RecordType.checklist => '체크리스트',
        RecordType.photo => '사진',
        RecordType.other => '기타',
      };

  static RecordType? fromString(String? value) => switch (value) {
        'TIME_BASED' => RecordType.timeBased,
        'WEIGHT_BASED' => RecordType.weightBased,
        'REP_BASED' => RecordType.repBased,
        'DISTANCE_BASED' => RecordType.distanceBased,
        'SURVEY' => RecordType.survey,
        'CHECKLIST' => RecordType.checklist,
        'PHOTO' => RecordType.photo,
        'OTHER' => RecordType.other,
        _ => null,
      };
}

/// 블루프린트 섹션 카드 제목 유형
enum BlueprintCardTitleEnum {
  @JsonValue('cool_down')
  coolDown,
  @JsonValue('warm_up')
  warmUp,
  @JsonValue('main_workout')
  mainWorkout,
  @JsonValue('aerobics')
  aerobics,
  @JsonValue('accessory')
  accessory,
}

extension BlueprintCardTitleEnumX on BlueprintCardTitleEnum {
  String get value => switch (this) {
        BlueprintCardTitleEnum.coolDown => 'cool_down',
        BlueprintCardTitleEnum.warmUp => 'warm_up',
        BlueprintCardTitleEnum.mainWorkout => 'main_workout',
        BlueprintCardTitleEnum.aerobics => 'aerobics',
        BlueprintCardTitleEnum.accessory => 'accessory',
      };

  String get displayName => switch (this) {
        BlueprintCardTitleEnum.coolDown => '쿨다운',
        BlueprintCardTitleEnum.warmUp => '웜업',
        BlueprintCardTitleEnum.mainWorkout => '메인 운동',
        BlueprintCardTitleEnum.aerobics => '에어로빅',
        BlueprintCardTitleEnum.accessory => '악세서리',
      };

  static BlueprintCardTitleEnum? fromString(String? value) => switch (value) {
        'cool_down' => BlueprintCardTitleEnum.coolDown,
        'warm_up' => BlueprintCardTitleEnum.warmUp,
        'main_workout' => BlueprintCardTitleEnum.mainWorkout,
        'aerobics' => BlueprintCardTitleEnum.aerobics,
        'accessory' => BlueprintCardTitleEnum.accessory,
        _ => null,
      };
}
