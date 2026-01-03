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
      final response = await supabase.from('workouts').select();
      final List<dynamic> data = response as List<dynamic>;
      return right(
        data.map((e) => WorkoutEntity.fromDto(WorkoutDto.fromJson(e))).toList(),
      );
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
