import 'package:json_annotation/json_annotation.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';

part 'user_profile_dto.g.dart';

/// 사용자 프로필 DTO
///
/// 참고: Supabase jsonb 타입 처리 문제로 인해 fromJson을 커스텀 구현
/// - Supabase는 빈 배열 {}를 빈 객체로 반환하는 경우가 있어 명시적 타입 캐스팅 필요
/// - @JsonSerializable()의 자동 생성 코드만으로는 jsonb 배열 파싱이 불안정할 수 있음
@JsonSerializable()
class UserProfileDto {
  final String? id;
  final String? accountId;
  final String? nickname;
  final String? bio;
  final String? profileImageUrl;
  final String? phoneNumber;
  final List<String>? fitnessGoals;
  final String? fitnessLevel;
  final DateTime? updatedAt;

  UserProfileDto({
    this.id,
    this.accountId,
    this.nickname,
    this.bio,
    this.profileImageUrl,
    this.phoneNumber,
    this.fitnessGoals,
    this.fitnessLevel,
    this.updatedAt,
  });

  /// Supabase jsonb 타입 처리를 위한 커스텀 fromJson
  ///
  /// Supabase에서 jsonb 필드(fitness_goals)는:
  /// - null 값 → null
  /// - 빈 배열 → {} (빈 객체)로 반환될 수 있어 명시적 List 캐스팅 필요
  /// - 일반 배열 → List<dynamic> 형태로 반환
  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    // jsonb 배열 명시적 처리
    List<String>? goals;
    if (json['fitness_goals'] != null) {
      if (json['fitness_goals'] is List) {
        goals = (json['fitness_goals'] as List)
            .map((e) => e.toString())
            .toList();
      }
    }

    return UserProfileDto(
      id: json['id'] as String?,
      accountId: json['account_id'] as String?,
      nickname: json['nickname'] as String?,
      bio: json['bio'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      fitnessGoals: goals,
      fitnessLevel: json['fitness_level'] as String?,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'].toString())
          : null,
    );
  }

  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);

  UserProfileEntity toEntity() => UserProfileEntity.fromDto(this);
}
