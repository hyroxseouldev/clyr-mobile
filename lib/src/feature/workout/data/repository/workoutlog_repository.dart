import 'dart:developer';

import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/workout/data/dto/workout_log_dto.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

part 'workoutlog_repository.g.dart';

@Riverpod(keepAlive: true)
WorkoutLogRepository workoutLogRepository(Ref ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return WorkoutLogRepositoryImpl(supabase: supabase);
}

abstract interface class WorkoutLogRepository {
  /// 운동 로그 생성
  FutureEither<AppException, WorkoutLogEntity> createWorkoutLog({
    required String title,
    required DateTime logDate,
    required Map<String, dynamic> content,
    required WorkoutIntensity intensity,
    String? programId,
  });

  /// 운동 로그 페이지네이션 조회
  FutureEither<AppException, List<WorkoutLogEntity>> getWorkoutLogs({
    required int page,
    required int limit,
  });

  /// 운동 로그 단건 조회
  FutureEither<AppException, WorkoutLogEntity> getWorkoutLogById({
    required String id,
  });

  /// 운동 로그 수정
  FutureEither<AppException, WorkoutLogEntity> updateWorkoutLog({
    required String id,
    String? title,
    DateTime? logDate,
    Map<String, dynamic>? content,
    WorkoutIntensity? intensity,
  });

  /// 운동 로그 삭제
  FutureEither<AppException, void> deleteWorkoutLog({required String id});
}

class WorkoutLogRepositoryImpl implements WorkoutLogRepository {
  final sb.SupabaseClient supabase;

  WorkoutLogRepositoryImpl({required this.supabase});

  String _getTableName() => 'workout_logs';

  @override
  FutureEither<AppException, WorkoutLogEntity> createWorkoutLog({
    required String title,
    required DateTime logDate,
    required Map<String, dynamic> content,
    required WorkoutIntensity intensity,
    String? programId,
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
      final insertData = {
        'user_id': userId,
        'title': title,
        'log_date': logDate.toIso8601String(),
        'content': content,
        'intensity': intensity.value,
      };
      if (programId != null) {
        insertData['program_id'] = programId;
      }

      final response = await supabase
          .from(_getTableName())
          .insert(insertData)
          .select()
          .single();

      final dto = WorkoutLogDto.fromJson(response);
      log('createWorkoutLog: 로그 생성 성공 - ${dto.id}');
      return right(dto.toEntity());
    } catch (e) {
      log('createWorkoutLog: 에러 = $e');
      return left(
        WorkoutException(code: 'create_failed', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, List<WorkoutLogEntity>> getWorkoutLogs({
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

    try {
      // Supabase range는 0-based, page는 1-based라고 가정
      final from = (page - 1) * limit;
      final to = from + limit - 1;

      final response = await supabase
          .from(_getTableName())
          .select('*')
          .eq('user_id', userId)
          .order('log_date', ascending: false)
          .range(from, to);

      final logs = response.map((e) => WorkoutLogDto.fromJson(e)).toList();

      log('getWorkoutLogs: 조회 성공 - page $page, ${logs.length}개');
      return right(logs.map((e) => e.toEntity()).toList());
    } catch (e) {
      log('getWorkoutLogs: 에러 = $e');
      return left(
        WorkoutException(code: 'fetch_failed', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, WorkoutLogEntity> getWorkoutLogById({
    required String id,
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
      final response = await supabase
          .from(_getTableName())
          .select('*')
          .eq('id', id)
          .eq('user_id', userId)
          .maybeSingle();

      if (response == null) {
        return left(
          WorkoutException(code: 'not_found', message: 'Workout log not found'),
        );
      }

      final dto = WorkoutLogDto.fromJson(response);
      log('getWorkoutLogById: 조회 성공 - $id');
      return right(dto.toEntity());
    } catch (e) {
      log('getWorkoutLogById: 에러 = $e');
      return left(
        WorkoutException(code: 'fetch_failed', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, WorkoutLogEntity> updateWorkoutLog({
    required String id,
    String? title,
    DateTime? logDate,
    Map<String, dynamic>? content,
    WorkoutIntensity? intensity,
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
      final updateData = <String, dynamic>{};
      if (title != null) updateData['title'] = title;
      if (logDate != null) updateData['log_date'] = logDate.toIso8601String();
      if (content != null) updateData['content'] = content;
      if (intensity != null) updateData['intensity'] = intensity.value;
      updateData['updated_at'] = DateTime.now().toIso8601String();

      final response = await supabase
          .from(_getTableName())
          .update(updateData)
          .eq('id', id)
          .eq('user_id', userId)
          .select()
          .single();

      final dto = WorkoutLogDto.fromJson(response);
      log('updateWorkoutLog: 수정 성공 - $id');
      return right(dto.toEntity());
    } catch (e) {
      log('updateWorkoutLog: 에러 = $e');
      return left(
        WorkoutException(code: 'update_failed', message: e.toString()),
      );
    }
  }

  @override
  FutureEither<AppException, void> deleteWorkoutLog({
    required String id,
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
      await supabase
          .from(_getTableName())
          .delete()
          .eq('id', id)
          .eq('user_id', userId);

      log('deleteWorkoutLog: 삭제 성공 - $id');
      return right(null);
    } catch (e) {
      log('deleteWorkoutLog: 에러 = $e');
      return left(
        WorkoutException(code: 'delete_failed', message: e.toString()),
      );
    }
  }
}
