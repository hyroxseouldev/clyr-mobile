import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/onboarding_controller.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/blueprint_section_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/blueprint_section_card.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/program_selector.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_type.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context);
    final selectedDate = ref.watch(selectedDateProvider);

    // 현재 활성화된 프로그램 상태 감지
    final activeProgramState = ref.watch(homeControllerProvider);

    // Watch onboarding status and redirect if not completed
    ref.listen<AsyncValue<bool>>(
      checkOnboardingStatusProvider,
      (previous, next) {
        next.when(
          data: (isOnboarded) {
            if (!isOnboarded) {
              // Redirect to onboarding
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.go(RoutePaths.onboarding);
              });
            }
          },
          loading: () {},
          error: (error, _) {
            // On error, allow to proceed to home
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.todaysWorkout),
            Text(
              DateFormat(
                'yyyy-MM-dd (E)',
                locale.languageCode,
              ).format(selectedDate),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 가로로 스크롤 되는 날짜 선택 위젯
                DateSelectionWidget(
                  showType: DateSelectionType.weekly,
                  selectedDate: selectedDate,
                  onDateSelected: (date) {
                    ref
                        .read(selectedDateProvider.notifier)
                        .setSelectedDate(date);
                  },
                  startDate: DateTime.now().subtract(const Duration(days: 7)),
                  endDate: DateTime.now().add(const Duration(days: 7)),
                ),
                Text(l10n.currentProgram),
                const SizedBox(height: 12),
                // 현재 등록된 프로그램 표시
                AsyncWidget<ActiveProgramEntity?>(
                  data: activeProgramState,
                  builder: (activeProgram) {
                    return ProgramSelector(
                      programList: activeProgram != null ? [activeProgram] : [],
                      selectedProgram: activeProgram,
                      onSelected: (program) {
                        // 프로그램 선택 처리 (필요 시 구현)
                      },
                    );
                  },
                ),
                const SizedBox(height: 24),
                // Blueprint sections list
                Text(
                  l10n.todaysSections,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                AsyncWidget<List<BlueprintSectionEntity>>(
                  data: ref.watch(blueprintSectionsProvider(selectedDate)),
                  builder: (sections) {
                    if (sections.isEmpty) {
                      return _buildEmptySections(context);
                    }
                    return Column(
                      children: sections.asMap().entries.map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return BlueprintSectionCard(
                          item: item,
                          index: index + 1,
                          isCompleted: entry.value.isCompleted,
                          showingCompleteButton:
                              entry.value.title == "main_workout",
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptySections(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 64,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noSectionsForDate,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }
}
