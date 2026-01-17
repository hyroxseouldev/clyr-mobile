import 'package:clyr_mobile/l10n/app_localizations.dart';
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
    final l10n = AppLocalizations.of(context)!;
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
        ).showSnackBar(SnackBar(content: Text(l10n.workoutLogDeleted)));
        context.go(RoutePaths.workoutLog);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.workoutLogDetail),
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
                builder: (context) {
                  final l10n = AppLocalizations.of(context)!;
                  return AlertDialog(
                    title: Text(l10n.deleteConfirm),
                    content: Text(l10n.deleteConfirmMessage),
                    actions: [
                      TextButton(
                        onPressed: () => context.pop(false),
                        child: Text(l10n.confirm),
                      ),
                      TextButton(
                        onPressed: () => context.pop(true),
                        child: Text(l10n.delete),
                      ),
                    ],
                  );
                }
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
                l10n.workoutContent,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    log.content['content']?.toString() ?? l10n.noContent,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // 생성/수정 정보
              Text(
                l10n.recordInfo,
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
                      title: Text(l10n.createdDate),
                      subtitle: Text(_formatDateTime(log.createdAt)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.update),
                      title: Text(l10n.modifiedDate),
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
