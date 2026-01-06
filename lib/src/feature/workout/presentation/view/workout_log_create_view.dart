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
        ).showSnackBar(SnackBar(content: Text("에러가 발생했습니다. 다시 시도해주세요.")));
      }

      if (next is AsyncData) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('운동 일지가 저장되었습니다')));
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
        title: const Text('운동 일지 작성'),
        actions: [
          TextButton.icon(
            onPressed: controller.isLoading ? null : saveLog,
            icon: const Icon(Icons.save),
            label: controller.isLoading
                ? const Text('저장중...')
                : const Text('저장'),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 제목 입력
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '제목',
                hintText: '예: 상체 운동',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '제목을 입력해주세요';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // 날짜 선택
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
                decoration: const InputDecoration(
                  labelText: '운동 날짜',
                  border: OutlineInputBorder(),
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

            // 운동 강도 선택
            InputDecorator(
              decoration: const InputDecoration(
                labelText: '운동 강도',
                border: OutlineInputBorder(),
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

            // 운동 내용 (큰 텍스트 영역)
            TextFormField(
              controller: contentController,
              maxLines: null,
              minLines: 10,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                labelText: '운동 내용',
                hintText:
                    '운동 내용을 자유롭게 기록해주세요\n\n예:\n벤치프레스 60kg 10회 3세트\n덤벨프레스 40kg 12회 3세트',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return '운동 내용을 입력해주세요';
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
