import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_logs_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/workout_log_mutation_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutLogCreateView extends HookConsumerWidget {
  final String programId;

  const WorkoutLogCreateView({super.key, required this.programId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final controller = ref.watch(createWorkoutLogControllerProvider);
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    final logDate = useState<DateTime>(DateTime.now());
    final selectedIntensity = useState<WorkoutIntensity>(
      WorkoutIntensity.medium,
    );
    final formKey = useMemoized(() => GlobalKey<FormState>());

    ref.listen(createWorkoutLogControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('${l10n.error} ${l10n.retry}')));
      }

      if (next is AsyncData) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.workoutLogSaved)));
      }
    });

    void saveLog() {
      if (!formKey.currentState!.validate()) return;

      ref
          .read(createWorkoutLogControllerProvider.notifier)
          .createWorkoutLog(
            title: titleController.text,
            logDate: logDate.value,
            content: {'content': contentController.text},
            intensity: selectedIntensity.value,
            programId: programId,
            onSuccess: (log) {
              ref.invalidate(getWorkoutLogsControllerProvider);
              context.go(RoutePaths.workoutLog);
            },
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.workoutLogTitle),
        actions: [
          TextButton.icon(
            onPressed: controller.isLoading ? null : saveLog,
            icon: const Icon(Icons.save),
            label: Text(controller.isLoading ? l10n.saving : l10n.save),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: l10n.title,
                hintText: l10n.titleHint,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.titleRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            InkWell(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: logDate.value,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now().add(const Duration(days: 30)),
                );
                if (picked != null) {
                  logDate.value = picked;
                }
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.workoutDate,
                  border: const OutlineInputBorder(),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(width: 8),
                    Text(
                      '${logDate.value.year}.${logDate.value.month}.${logDate.value.day}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.workoutIntensity,
                border: const OutlineInputBorder(),
              ),
              child: SegmentedButton<WorkoutIntensity>(
                segments: const [
                  ButtonSegment(
                    value: WorkoutIntensity.low,
                    label: Text('낮음'),
                    icon: Icon(Icons.trending_down, size: 18),
                  ),
                  ButtonSegment(
                    value: WorkoutIntensity.medium,
                    label: Text('보통'),
                    icon: Icon(Icons.trending_flat, size: 18),
                  ),
                  ButtonSegment(
                    value: WorkoutIntensity.high,
                    label: Text('높음'),
                    icon: Icon(Icons.trending_up, size: 18),
                  ),
                ],
                selected: {selectedIntensity.value},
                onSelectionChanged: (Set<WorkoutIntensity> newSelection) {
                  selectedIntensity.value = newSelection.first;
                },
              ),
            ),
            const SizedBox(height: 16),

            TextFormField(
              controller: contentController,
              maxLines: null,
              minLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                labelText: l10n.workoutContent,
                hintText: l10n.workoutContentHint,
                border: const OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.contentRequired;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
