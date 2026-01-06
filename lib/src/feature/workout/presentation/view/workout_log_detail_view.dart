import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_log_by_id_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_logs_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/workout_log_mutation_controller.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutLogDetailView extends ConsumerWidget {
  final String logId;

  const WorkoutLogDetailView({super.key, required this.logId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logState = ref.watch(getWorkoutLogByIdControllerProvider(logId));

    ref.listen(deleteWorkoutLogControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
      if (next is AsyncData) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('운동 일지가 삭제되었습니다')));
        context.go(RoutePaths.workoutLog);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('운동 일지 상세'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              context.go('${RoutePaths.workoutLog}/detail/$logId/edit');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('삭제 확인'),
                  content: const Text('정말 이 운동 일지를 삭제하시겠습니까?'),
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(false),
                      child: const Text('취소'),
                    ),
                    TextButton(
                      onPressed: () => context.pop(true),
                      child: const Text('삭제'),
                    ),
                  ],
                ),
              );

              if (confirmed == true && context.mounted) {
                ref
                    .read(deleteWorkoutLogControllerProvider.notifier)
                    .deleteWorkoutLog(
                      id: logId,
                      onSuccess: () {
                        ref.invalidate(getWorkoutLogsControllerProvider);
                        context.go(RoutePaths.workoutLog);
                      },
                    );
              }
            },
          ),
        ],
      ),
      body: AsyncWidget<WorkoutLogEntity>(
        data: logState,
        builder: (log) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // 헤더 카드
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.title,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDate(log.logDate),
                            style: TextStyle(color: Colors.grey.shade600),
                          ),
                          const SizedBox(width: 16),
                          _buildIntensityChip(log.intensity),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 운동 내용
              Text(
                '운동 내용',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    log.content['content']?.toString() ?? '내용 없음',
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 생성/수정 정보
              Text(
                '기록 정보',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.create),
                      title: const Text('생성일'),
                      subtitle: Text(_formatDateTime(log.createdAt)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.update),
                      title: const Text('수정일'),
                      subtitle: Text(_formatDateTime(log.updatedAt)),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIntensityChip(WorkoutIntensity intensity) {
    Color color;
    String label;

    switch (intensity) {
      case WorkoutIntensity.low:
        color = Colors.green;
        label = '낮음';
        break;
      case WorkoutIntensity.medium:
        color = Colors.orange;
        label = '보통';
        break;
      case WorkoutIntensity.high:
        color = Colors.red;
        label = '높음';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}.${date.month}.${date.day}';
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.year}.${dateTime.month}.${dateTime.day} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
