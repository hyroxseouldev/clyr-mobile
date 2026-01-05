import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_daily_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/date_selector.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/program_card.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/session_card.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProgramDetailView extends HookConsumerWidget {
  final String programId;
  final String? workoutId;

  const ProgramDetailView({super.key, required this.programId, this.workoutId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 선택한 날짜 상태 관리
    final selectedDate = useState<DateTime>(DateTime.now());

    // 선택한 날짜의 워크아웃 일일 정보 조회
    final dailyState = ref.watch(
      getWorkoutDailyControllerProvider(selectedDate.value, programId),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('프로그램 상세')),
      body: Column(
        children: [
          // 가로 스크롤 날짜 선택 위젯
          DateSelector(
            selectedDate: selectedDate.value,
            onDateSelected: (date) => selectedDate.value = date,
          ),
          const Divider(height: 1),

          // 워크아웃 일일 정보 표시
          Expanded(
            child: AsyncWidget<WorkoutDailyEntity>(
              data: dailyState,
              builder: (daily) {
                // enrollment가 없는 상태 (구매한 프로그램 없음)
                if (!daily.hasEnrollment) {
                  return _buildNoEnrollmentPrompt(context);
                }

                // 미래 날짜 접근 제한 상태 (4일 뒤 이상)
                if (daily.isFutureRestricted) {
                  return _buildFutureRestrictedPrompt(context);
                }

                // 시작 날짜 미설정 상태
                if (!daily.isStartDateSet) {
                  return _buildNoStartDatePrompt(context);
                }

                // 시작 날짜 이전 상태
                if (daily.isBeforeStartDate) {
                  return _buildBeforeStartDatePrompt(context);
                }

                // 워크아웃 없음 (해당 날짜에 워크아웃이 없음)
                if (daily.workout == null) {
                  return _buildNoWorkoutPrompt(context);
                }

                // 워크아웃 상세
                return SingleChildScrollView(
                  child: _buildWorkoutCard(context, daily.workout!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 구매한 프로그램 없음 프롬프트
  Widget _buildNoEnrollmentPrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: Colors.orange.shade300,
            ),
            const SizedBox(height: 24),
            Text(
              '구매한 프로그램이 없습니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '먼저 프로그램을 구매해주세요\n프로그램을 구매하면 맞춤 워크아웃을 제공합니다',
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

  /// 시작 날짜 미설정 프롬프트
  Widget _buildNoStartDatePrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_available, size: 80, color: Colors.amber.shade300),
            const SizedBox(height: 24),
            Text(
              '시작일을 설정해주세요',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '프로그램 시작일을 설정하면\n맞춤 워크아웃을 제공합니다',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                context.go(
                  '${RoutePaths.workout}/program/$programId/start-date-setup',
                );
              },
              child: const Text('시작일 설정'),
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
            Icon(Icons.lock_clock, size: 80, color: Colors.red.shade300),
            const SizedBox(height: 24),
            Text(
              '아직 볼 수 없습니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '최대 4일 뒤까지의 워크아웃만 확인할 수 있습니다\n날짜를 조금 더 가까운 날로 선택해주세요',
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

  /// 워크아웃 없음 프롬프트
  Widget _buildNoWorkoutPrompt(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 24),
            Text(
              '해당 날짜에 워크아웃이 없습니다',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              '오늘은 휴식일입니다\n충분한 휴식을 취하세요',
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

  /// 워크아웃 카드 (리스트 아이템)
  Widget _buildWorkoutCard(
    BuildContext context,
    WorkoutWithSession workoutWithSession,
  ) {
    final workout = workoutWithSession.workout;
    final sessions = [...workoutWithSession.sessions]
      ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    final dayNumber = workoutWithSession.relativeDayNumber;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day 헤더
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day $dayNumber',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    workout.title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: Colors.white),
                  ),
                  if (workout.programWeek != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      workout.programWeek!.title,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 세션 목록
            Text('오늘의 운동', style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),

            if (sessions.isEmpty)
              const Center(
                child: Text('등록된 세션이 없습니다.', style: TextStyle(fontSize: 14)),
              )
            else
              // indexing ordering
              ...sessions.map(
                (session) => SessionCard(session: session, compact: true),
              ),
          ],
        ),
      ),
    );
  }
}
