import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_controller.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutPage extends HookConsumerWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutsState = ref.watch(getWorkoutControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Workout')),
      body: AsyncWidget<List<WorkoutEntity>>(
        data: workoutsState,
        builder: (workouts) => ListView.builder(
          itemBuilder: (context, index) {
            return Text(workouts[index].name);
          },
        ),
      ),
    );
  }
}
