import 'dart:developer';

import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/workout/data/dto/workout_dto.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'workout_repository.g.dart';

@Riverpod(keepAlive: true)
WorkoutRepository workoutRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return WorkoutRepositoryImpl(supabase: supabase);
}

abstract interface class WorkoutRepository {
  FutureEither<WorkoutException, void> createWorkoutLog(
    ({String workoutId, String log}) params,
  );
  FutureEither<AppException, DateTime> getStartDate();
  FutureEither<AppException, void> setStartDate(DateTime date);
  FutureEither<AppException, WorkoutDailyEntity> getWorkoutDaily({
    required DateTime date,
    required String programId,
  });
  FutureEither<AppException, List<ProgramEntity>> getProgramInfo({
    required int page,
    required int limit,
  });
}

class WorkoutRepositoryImpl implements WorkoutRepository {
  final sb.SupabaseClient supabase;
  WorkoutRepositoryImpl({required this.supabase});

  @override
  FutureEither<AppException, WorkoutDailyEntity> getWorkoutDaily({
    required DateTime date,
    required String programId,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        WorkoutException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }

    try {
      // 날짜 정규화 (자정 기준)
      final targetDateAtMidnight = DateTime(date.year, date.month, date.day);
      final today = DateTime.now();
      final todayAtMidnight = DateTime(today.year, today.month, today.day);

      // 1. 미래 날짜 접근 제한 체크 (오늘부터 4일 뒤까지만 허용)
      final daysFromToday = targetDateAtMidnight
          .difference(todayAtMidnight)
          .inDays;
      if (daysFromToday > 4) {
        log('getWorkoutDaily: 미래 날짜 접근 제한 ($daysFromToday일 후)');
        return right(WorkoutDailyEntity.futureRestricted());
      }

      // 2. programId로 enrollment 조회 (단일)
      final enrollmentResult = await supabase
          .from('enrollments')
          .select('start_date, program_id, created_at')
          .eq('user_id', userId)
          .eq('program_id', programId)
          .eq('status', 'ACTIVE')
          .maybeSingle();

      // enrollment가 없는 경우 (구매하지 않은 프로그램)
      if (enrollmentResult == null) {
        log('getWorkoutDaily: enrollment 레코드 없음 (프로그램 미구매)');
        return right(WorkoutDailyEntity.noEnrollment());
      }

      // start_date가 없는 경우
      if (enrollmentResult['start_date'] == null) {
        log('getWorkoutDaily: start_date 없음');
        return right(WorkoutDailyEntity.noStartDate());
      }

      // 시작 날짜 추출
      final enrollmentStartDate = enrollmentResult['start_date'] is String
          ? DateTime.parse(enrollmentResult['start_date'])
          : enrollmentResult['start_date'];
      final enrollmentStartDateAtMidnight = DateTime(
        enrollmentStartDate.year,
        enrollmentStartDate.month,
        enrollmentStartDate.day,
      );

      log(
        'getWorkoutDaily: enrollmentStartDate=$enrollmentStartDate, programId=$programId',
      );

      // 시작 날짜 이전 체크
      if (targetDateAtMidnight.isBefore(enrollmentStartDateAtMidnight)) {
        log(
          'getWorkoutDaily: 시작 날짜 이전 ($targetDateAtMidnight < $enrollmentStartDateAtMidnight)',
        );
        return right(WorkoutDailyEntity.beforeStartDate());
      }

      // relativeDayNumber 계산
      final relativeDayNumber =
          targetDateAtMidnight
              .difference(enrollmentStartDateAtMidnight)
              .inDays +
          1;

      log(
        'getWorkoutDaily: targetDate=$targetDateAtMidnight, relativeDayNumber=$relativeDayNumber',
      );

      // 특정 dayNumber의 워크아웃 조회
      final response = await supabase
          .from('workouts')
          .select('''
            id,
            program_id,
            week_id,
            day_number,
            title,
            content,
            created_at,
            programs (
              id,
              title,
              program_image,
              main_image_list,
              description
            ),
            program_weeks (
              id,
              program_id,
              week_number,
              title,
              description
            ),
            workout_sessions (
              id,
              workout_id,
              title,
              content,
              order_index
            )
          ''')
          .eq('program_id', programId)
          .eq('day_number', relativeDayNumber)
          .maybeSingle();

      if (response == null) {
        log('getWorkoutDaily: dayNumber $relativeDayNumber에 해당하는 워크아웃 없음');
        return right(WorkoutDailyEntity.withStartDate(workout: null));
      }

      // DTO → Entity 변환
      final weekData = response['program_weeks'] as Map<String, dynamic>?;
      final programData = response['programs'] as Map<String, dynamic>?;
      final workoutEntity = WorkoutEntity(
        id: response['id'],
        programId: response['program_id'],
        weekId: response['week_id'],
        dayNumber: response['day_number'],
        title: response['title'],
        content: response['content'],
        createdAt: DateTime.parse(response['created_at']),
        programWeek: weekData != null
            ? ProgramWeekEntity(
                id: weekData['id'],
                programId: weekData['program_id'],
                weekNumber: weekData['week_number'],
                title: weekData['title'],
                description: weekData['description'],
              )
            : null,
        program: programData != null
            ? ProgramEntity(
                id: programData['id'],
                name: programData['title'],
                programImage: programData['program_image'],
                mainImageList: programData['main_image_list'] != null
                    ? List<String>.from(programData['main_image_list'])
                    : null,
                description: programData['description'],
              )
            : null,
        sessions: (response['workout_sessions'] as List<dynamic>?)
            ?.map(
              (s) => WorkoutSessionEntity(
                id: s['id'],
                workoutId: s['workout_id'],
                title: s['title'],
                content: s['content'],
                orderIndex: s['order_index'],
              ),
            )
            .toList(),
      );

      final workoutWithSession = WorkoutWithSession.fromEntities(
        workout: workoutEntity,
        sessions: workoutEntity.sessions ?? [],
        relativeDayNumber: relativeDayNumber,
      );

      log('getWorkoutDaily: 워크아웃 찾음 = ${workoutEntity.title}');

      return right(
        WorkoutDailyEntity.withStartDate(workout: workoutWithSession),
      );
    } catch (e) {
      log('getWorkoutDaily: 에러 = $e');
      return left(WorkoutException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, void> setStartDate(DateTime date) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        WorkoutException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }
    try {
      await supabase
          .from('enrollments')
          .update({'start_date': date.toIso8601String()})
          .eq('user_id', userId);
      return right(null);
    } catch (e) {
      log('setStartDate: 에러 = $e');
      return left(WorkoutException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<AppException, DateTime> getStartDate() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      log('getStartDate: 사용자 인증 안됨');
      return left(
        WorkoutException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }
    try {
      final response = await supabase
          .from('enrollments')
          .select('start_date')
          .eq('user_id', userId);
      log('getStartDate: response = $response');
      if (response.isEmpty) {
        log('getStartDate: enrollment 레코드 없음');
        return left(
          WorkoutException(
            code: 'no_enrollment',
            message: 'No enrollment found',
          ),
        );
      }
      return right(response[0]['start_date']);
    } catch (e) {
      log('getStartDate: 에러 = $e');
      return left(WorkoutException(code: 'unknown', message: e.toString()));
    }
  }

  @override
  FutureEither<WorkoutException, void> createWorkoutLog(
    ({String workoutId, String log}) params,
  ) async {
    try {
      final response = await supabase.from('workout_logs').insert({
        'workout_id': params.workoutId,
        'log': params.log,
      });
      return right(WorkoutEntity.fromDto(WorkoutDto.fromJson(response)));
    } catch (e) {
      return left(WorkoutException(code: 'unknown', message: e.toString()));
    }
  }

  // 내가 현재 가지고 있는 활성화된 enrollments 들의 program 정보를 조회합니다.
  @override
  FutureEither<AppException, List<ProgramEntity>> getProgramInfo({
    required int page,
    required int limit,
  }) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) {
      return left(
        WorkoutException(
          code: 'not_authenticated',
          message: 'User not authenticated',
        ),
      );
    }
    log('getProgramInfo: page=$page, limit=$limit');
    try {
      // Supabase range는 0-based, page는 1-based라고 가정
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      // enrollments와 programs를 join하여 program 정보 조회
      final response = await supabase
          .from('enrollments')
          .select('''
            programs(
              id,
              title,
              program_image,
              main_image_list,
              description
            )
          ''')
          .eq('user_id', userId)
          .range(from, to);

      // 응답 구조: [{programs: {...}}, ...]
      final programs = response.map<ProgramEntity>((e) {
        final programData = e['programs'] as Map<String, dynamic>;
        return ProgramEntity(
          id: programData['id'],
          name: programData['title'], // title → name 매핑
          programImage: programData['program_image'],
          mainImageList: programData['main_image_list'] != null
              ? List<String>.from(programData['main_image_list'])
              : null,
          description: programData['description'],
        );
      }).toList();

      return right(programs);
    } catch (e) {
      log('getProgramInfo: 에러 = $e');
      return left(WorkoutException(code: 'unknown', message: e.toString()));
    }
  }
}
