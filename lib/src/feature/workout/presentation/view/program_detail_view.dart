import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_daily_entity.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_daily_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/date_selector.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/widget/session_card.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProgramDetailView extends HookConsumerWidget {
  final String programId;
  final String? workoutId;

  const ProgramDetailView({super.key, required this.programId, this.workoutId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    // 선택한 날짜 상태 관리
    final selectedDate = useState<DateTime>(DateTime.now());

    // 선택한 날짜의 워크아웃 일일 정보 조회
    final dailyState = ref.watch(
      getWorkoutDailyControllerProvider(selectedDate.value, programId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.programDetail)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go(
            '${RoutePaths.workout}/program/$programId/workout-log-create',
          );
        },
        child: const Icon(Icons.add),
      ),
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
    final l10n = AppLocalizations.of(context)!;
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
              l10n.noEnrollment,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.noEnrollmentDesc,
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
    final l10n = AppLocalizations.of(context)!;
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
              l10n.notYetStarted,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.notYetStartedDesc,
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
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_available, size: 80, color: Colors.amber.shade300),
            const SizedBox(height: 24),
            Text(
              l10n.selectStartDate,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.selectStartDateDesc,
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
              child: Text(l10n.setStartDate),
            ),
          ],
        ),
      ),
    );
  }

  /// 미래 날짜 접근 제한 프롬프트
  Widget _buildFutureRestrictedPrompt(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock_clock, size: 80, color: Colors.red.shade300),
            const SizedBox(height: 24),
            Text(
              l10n.notAvailableYet,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.notAvailableYetDesc,
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
    final l10n = AppLocalizations.of(context)!;
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
              l10n.noWorkoutThisDate,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.restDay,
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
    final l10n = AppLocalizations.of(context)!;
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
            Text(l10n.todaysWorkout, style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(height: 8),

            if (sessions.isEmpty)
              Center(
                child: Text(l10n.noSessions, style: const TextStyle(fontSize: 14)),
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
