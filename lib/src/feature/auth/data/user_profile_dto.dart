import 'package:json_annotation/json_annotation.dart';
part 'user_profile_dto.g.dart';

// id: uuid("id").primaryKey().defaultRandom(),
//   accountId: uuid("account_id")
//     .references(() => account.id, { onDelete: "cascade" })
//     .unique()
//     .notNull(),

//   nickname: text("nickname"), // 사용자 별명
//   bio: text("bio"), // 자기소개
//   profileImageUrl: text("profile_image_url"), // 프로필 이미지 URL
//   phoneNumber: text("phone_number"), // 연락처

//   // 운동 관련 메타데이터
//   fitnessGoals: jsonb("fitness_goals")
//     .default([])
//     .$type<string[]>(), // 운동 목표 (예: ["체중감량", "근력증가"])
//   fitnessLevel: text("fitness_level").$type<"BEGINNER" | "INTERMEDIATE" | "ADVANCED">(), // 운동 수준

//   updatedAt: timestamp("updated_at").defaultNow().notNull(),

@JsonSerializable()
class UserProfileDto {
  // 주석을 보고 만들어
  final String accountId;
  final String nickname;
  final String bio;
  final String profileImageUrl;
  final String phoneNumber;
  final List<String> fitnessGoals;
  final String fitnessLevel;
  final DateTime updatedAt;

  UserProfileDto({
    required this.accountId,
    required this.nickname,
    required this.bio,
    required this.profileImageUrl,
    required this.phoneNumber,
    required this.fitnessGoals,
    required this.fitnessLevel,
    required this.updatedAt,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileDtoToJson(this);
}
