import 'package:clyr_mobile/src/core/pagination/paginated_list_view.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_log_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_logs_controller.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkoutLogView extends ConsumerWidget {
  const WorkoutLogView({super.key});
  static const String routeName = 'workoutLog';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logsState = ref.watch(getWorkoutLogsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.description_outlined),
            const SizedBox(width: 8),
            const Text('운동 기록', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: AsyncWidget<PaginatedData<WorkoutLogEntity>>(
        data: logsState,
        builder: (data) {
          return PaginatedListView<WorkoutLogEntity>(
            items: data.items,
            hasMore: data.hasMore,
            isLoading: data.isLoading,
            error: data.error,
            onRefresh: () async {
              await ref
                  .read(getWorkoutLogsControllerProvider.notifier)
                  .refresh();
            },

            onLoadMore: () {
              ref.read(getWorkoutLogsControllerProvider.notifier).loadNext();
            },
            itemBuilder: (context, log, index) {
              return ListTile(
                onTap: () =>
                    context.push('${RoutePaths.workoutLogDetail}/${log.id}'),
                leading: _buildIntensityIcon(log.intensity),
                title: Text(
                  log.title,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      _formatDate(log.logDate),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    if (log.content.isNotEmpty)
                      Text(
                        _getContentPreview(log.content),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
                trailing: const Icon(Icons.chevron_right),
              );
            },
            separatorBuilder: (context, index) => const Divider(height: 1),
            emptyWidget: _buildEmptyState(context),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    // 1. SafeArea와 Expanded를 모두 제거합니다.
    // 2. 부모(PaginatedListView)가 제공하는 공간 내에서 중앙 정렬을 수행합니다.
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          // Column이 수직으로 꽉 차지 않게 최소한의 크기만 갖도록 설정
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 24),
            Text(
              '운동 일지가 없습니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              '오른쪽 하단의 + 버튼을 눌러\n운동 일지를 작성해보세요',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntensityIcon(WorkoutIntensity intensity) {
    Color color;
    IconData icon;

    switch (intensity) {
      case WorkoutIntensity.low:
        color = Colors.green;
        icon = Icons.trending_down;
        break;
      case WorkoutIntensity.medium:
        color = Colors.orange;
        icon = Icons.trending_flat;
        break;
      case WorkoutIntensity.high:
        color = Colors.red;
        icon = Icons.trending_up;
        break;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final logDate = DateTime(date.year, date.month, date.day);

    final difference = today.difference(logDate).inDays;

    if (difference == 0) return '오늘';
    if (difference == 1) return '어제';
    if (difference == -1) return '내일';

    return '${date.year}.${date.month}.${date.day}';
  }

  String _getContentPreview(Map<String, dynamic> content) {
    if (content.isEmpty) return '내용 없음';

    final firstValue = content.values.first;
    if (firstValue is String) {
      return firstValue;
    }
    return firstValue.toString();
  }
}
