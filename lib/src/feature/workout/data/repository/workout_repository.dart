import 'dart:developer';

import 'package:clyr_mobile/src/core/exception/exception.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/core/typedef/typedef.dart';
import 'package:clyr_mobile/src/feature/workout/data/dto/workout_dto.dart';
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
  FutureEither<AppException, List<WorkoutEntity>> getWorkouts();
  FutureEither<WorkoutException, void> createWorkoutLog(
    ({String workoutId, String log}) params,
  );
}

class WorkoutRepositoryImpl implements WorkoutRepository {
  final sb.SupabaseClient supabase;
  WorkoutRepositoryImpl({required this.supabase});

  @override
  FutureEither<WorkoutException, List<WorkoutEntity>> getWorkouts() async {
    try {
      // Get current user ID from Supabase auth
      final userId = supabase.auth.currentUser?.id;
      if (userId == null) {
        return left(WorkoutException(code: 'not_authenticated', message: 'User not authenticated'));
      }

      // Fetch enrollments with nested hierarchy:
      // enrollment → program → program_weeks → workouts → workout_sessions
      final response = await supabase
          .from('enrollments')
          .select('''
            program_id,
            programs (
              program_weeks (
                id,
                program_id,
                week_number,
                title,
                description,
                workouts (
                  id,
                  program_id,
                  week_id,
                  day_number,
                  title,
                  content,
                  created_at,
                  workout_sessions (
                    id,
                    workout_id,
                    title,
                    content,
                    order_index
                  )
                )
              )
            )
          ''')
          .eq('user_id', userId)
          .eq('status', 'ACTIVE');

      final List<dynamic> data = response as List<dynamic>;

      // Flatten the nested structure to extract all workouts
      final List<WorkoutEntity> allWorkouts = [];

      for (final enrollment in data) {
        final program = enrollment['programs'] as Map<String, dynamic>?;
        if (program == null) continue;

        final weeks = program['program_weeks'] as List<dynamic>?;
        if (weeks == null) continue;

        for (final weekData in weeks) {
          final weekDto = ProgramWeeksDto.fromJson(weekData as Map<String, dynamic>);
          final weekEntity = ProgramWeekEntity.fromDto(weekDto);

          // Get workouts from the week
          final workouts = weekData['workouts'] as List<dynamic>?;
          if (workouts == null) continue;

          for (final workoutData in workouts) {
            final workoutDto = WorkoutsNestedDto.fromJson(workoutData as Map<String, dynamic>);
            final workoutEntity = WorkoutEntity(
              id: workoutDto.id,
              programId: workoutDto.programId,
              weekId: workoutDto.weekId,
              dayNumber: workoutDto.dayNumber,
              title: workoutDto.title,
              content: workoutDto.content,
              createdAt: workoutDto.createdAt,
              programWeek: weekEntity,
              sessions: workoutDto.workoutSessions
                  ?.map((s) => WorkoutSessionEntity.fromDto(s))
                  .toList(),
            );
            allWorkouts.add(workoutEntity);
          }
        }
      }

      return right(allWorkouts);
    } catch (e) {
      log(e.toString());
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
}
