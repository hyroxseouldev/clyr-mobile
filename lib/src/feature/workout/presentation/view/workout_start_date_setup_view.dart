import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/get_workout_daily_controller.dart';
import 'package:clyr_mobile/src/feature/workout/presentation/provider/set_start_date_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

class WorkoutStartDateSetupView extends HookConsumerWidget {
  const WorkoutStartDateSetupView({super.key, required this.programId});
  final String programId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = useState<DateTime>(DateTime.now());
    final controller = ref.watch(setStartDateControllerProvider);
    Future<void> selectDate() async {
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(2020),
        lastDate: DateTime.now().add(const Duration(days: 365)),
        locale: const Locale('ko', 'KR'),
        helpText: '프로그램 시작일',
        confirmText: '확인',
        cancelText: '취소',
      );

      if (picked != null) {
        selectedDate.value = picked;
      }
    }

    Future<void> saveStartDate() async {
      // 자정으로 설정
      final dateAtMidnight = DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
      );

      await ref
          .read(setStartDateControllerProvider.notifier)
          .setStartDate(
            date: dateAtMidnight,
            programId: programId,
            onSuccess: () {
              if (context.mounted) {
                context.go(RoutePaths.workout);
              }
            },
          );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('프로그램 시작일 설정')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),

              // 아이콘
              const Icon(
                Icons.fitness_center_outlined,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 24),

              // 제목
              Text(
                '프로그램을 시작할 날짜를\n선택해주세요',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // 설명
              Text(
                '선택한 날짜를 Day 1로 시작하여\n맞춤 워크아웃을 제공합니다',
                textAlign: TextAlign.center,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
              ),

              const SizedBox(height: 48),

              // 날짜 선택 카드
              InkWell(
                onTap: selectDate,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 32,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        DateFormat(
                          'yyyy년 M월 d일 (E)',
                          'ko',
                        ).format(selectedDate.value),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '날짜를 선택하려면 탭하세요',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 에러 메시지
              if (controller.hasError) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red.shade700,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          controller.error.toString(),
                          style: TextStyle(
                            color: Colors.red.shade700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              const Spacer(),

              // 시작하기 버튼
              FilledButton.icon(
                onPressed: controller.isLoading ? null : saveStartDate,
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: controller.isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.rocket_launch),
                label: Text(
                  controller.isLoading ? '설정 중...' : '시작하기',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
