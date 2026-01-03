import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_daily_controller.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class WorkoutPage extends HookConsumerWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get today's date at midnight
    final today = DateTime.now();
    final selectedDate = useState<DateTime>(
      DateTime(today.year, today.month, today.day),
    );

    // 선택한 날짜의 워크아웃 일일 정보 조회
    final dailyState = ref.watch(
      getWorkoutDailyControllerProvider(selectedDate.value),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Workout')),
      body: Column(
        children: [
          // 가로 스크롤 날짜 선택 위젯
          _DateSelector(
            selectedDate: selectedDate.value,
            onDateSelected: (date) => selectedDate.value = date,
          ),
          const Divider(height: 1),

          // 선택한 날짜 표시
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  DateFormat(
                    'yyyy년 M월 d일 (E)',
                    'ko',
                  ).format(selectedDate.value),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),

          // 워크아웃 일일 정보
          Expanded(
            child: AsyncWidget<WorkoutDailyEntity>(
              data: dailyState,
              builder: (daily) {
                // 시작 날짜 미설정 상태
                if (!daily.isStartDateSet) {
                  return _buildStartDatePrompt(context);
                }

                // 시작 날짜 이전 상태
                if (daily.isBeforeStartDate) {
                  return _buildBeforeStartDatePrompt(context);
                }

                // 미래 날짜 접근 제한 상태
                if (daily.isFutureRestricted) {
                  return _buildFutureRestrictedPrompt(context);
                }

                // 워크아웃 없음 (해당 날짜에 워크아웃이 없음)
                if (daily.workout == null) {
                  return const Center(child: Text('해당 날짜에 워크아웃이 없습니다.'));
                }

                // 워크아웃 상세
                return _buildWorkoutDetail(context, daily.workout!);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 시작 날짜 설정 프롬프트
  Widget _buildStartDatePrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.fitness_center_outlined,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            Text(
              '프로그램 시작일을 선택해주세요!',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '시작일을 설정하면 맞춤 워크아웃을 제공합니다',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: () {
                context.go(RoutePaths.workoutStartDateSetup);
                // 시작일 설정 완료 후 화면 갱신은 Controller가 자동으로 처리
              },
              icon: const Icon(Icons.calendar_today),
              label: const Text('시작일 선택'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 시작 날짜 이전 프롬프트
  Widget _buildBeforeStartDatePrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_toggle_off,
              size: 80,
              color: Colors.blue.shade200,
            ),
            const SizedBox(height: 24),
            Text(
              '시작 전입니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '프로그램 시작일 이전입니다\n시작일부터 확인할 수 있습니다',
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

  /// 미래 날짜 접근 제한 프롬프트
  Widget _buildFutureRestrictedPrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_outline, size: 80, color: Colors.orange.shade300),
            const SizedBox(height: 24),
            Text(
              '아직 공개되지 않았습니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '최대 4일 뒤까지 확인할 수 있습니다\n하루가 지날 때마다 새로운 운동이 공개됩니다',
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

  /// 워크아웃 상세 화면
  Widget _buildWorkoutDetail(
    BuildContext context,
    WorkoutWithSession workoutWithSession,
  ) {
    final workout = workoutWithSession.workout;
    final sessions = workoutWithSession.sessions;
    final dayNumber = workoutWithSession.relativeDayNumber;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day 카드
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day $dayNumber',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  workout.title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
                if (workout.programWeek != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    workout.programWeek!.title,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 24),

          // 세션 목록
          Text('오늘의 운동', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),

          if (sessions.isEmpty)
            const Center(child: Text('등록된 세션이 없습니다.'))
          else
            ...sessions.map((session) => _SessionCard(session: session)),
        ],
      ),
    );
  }
}

/// 세션 카드 위젯
class _SessionCard extends StatelessWidget {
  final WorkoutSessionEntity session;

  const _SessionCard({required this.session});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(child: Text('${session.orderIndex + 1}')),
        title: Text(session.title),
        subtitle: session.content != null ? Text(session.content!) : null,
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

/// 가로 스크롤 가능한 날짜 선택 위젯
class _DateSelector extends HookWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const _DateSelector({
    required this.selectedDate,
    required this.onDateSelected,
  });

  void _scrollToToday(ScrollController controller) {
    // 오늘 날짜는 인덱스 7 (-7부터 시작하므로)
    const todayIndex = 7;
    // 아이템 너비(60) + margin(horizontal 4 * 2) = 68
    const itemWidth = 68.0;
    // 화면 너비의 절반에서 아이템 너비의 절반을 뺀 만큼 스크롤
    final viewportWidth = controller.position.viewportDimension;
    final targetOffset =
        (todayIndex * itemWidth) - (viewportWidth / 2) + (itemWidth / 2);

    controller.animateTo(
      targetOffset.clamp(0.0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<DateTime> _generateDateRange() {
    final today = DateTime.now();
    final dates = <DateTime>[];
    // 오늘부터 앞으로 30일까지 표시
    for (int i = -7; i < 30; i++) {
      dates.add(
        DateTime(today.year, today.month, today.day).add(Duration(days: i)),
      );
    }
    return dates;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    final dates = _generateDateRange();
    final now = DateTime.now();
    final scrollController = useScrollController();

    // 첫 렌더링 후 오늘 날짜가 가운데 오도록 스크롤
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToToday(scrollController);
      });
      return null;
    }, []);

    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = _isSameDay(date, selectedDate);
          final isToday = _isSameDay(date, now);

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : isToday
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected || isToday
                      ? Colors.transparent
                      : Colors.grey.shade300,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 요일
                  Text(
                    DateFormat('E', 'ko').format(date),
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 날짜
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // 오늘 표시
                  if (isToday && !isSelected)
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
