import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/blueprint_section_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/blueprint_section_card.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/program_selector.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_type.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = useState<DateTime>(DateTime.now());

    // 현재 활성화된 프로그램 상태 감지
    final activeProgramState = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.todaysWorkout),
            Text(
              DateFormat('yyyy-MM-dd (E)', 'ko').format(selectedDate.value),
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
                  selectedDate: selectedDate.value,
                  onDateSelected: (date) => selectedDate.value = date,
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
                  data: ref.watch(
                    blueprintSectionsProvider(selectedDate.value),
                  ),
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
                          showingCompleteButton: entry.value.title == "본운동",
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
