import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/blueprint_section_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/presentation/provider/leaderboard_provider.dart';
import 'package:clyr_mobile/src/feature/log/presentation/widget/leaderboard_session_box.dart';
import 'package:clyr_mobile/src/feature/log/presentation/widget/log_leader_board_widget.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_type.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogView extends ConsumerWidget {
  const LogView({super.key});
  static const String routeName = 'log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = ref.watch(selectedDateProvider);
    final activeProgramState = ref.watch(homeControllerProvider);
    final todaysSessionState = ref.watch(
      todaysSessionStateProvider(selectedDate),
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AsyncWidget<ActiveProgramEntity>(
              data: activeProgramState,
              minHeight: 240,
              builder: (activeProgram) {
                return activeProgram.maybeWhen(
                  (
                    id,
                    title,
                    programImage,
                    mainImageList,
                    description,
                    startDate,
                    endDate,
                    coachProfileUrl,
                    coachName,
                  ) {
                    return Column(
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
                          startDate: startDate,
                          endDate: endDate,
                        ),
                      ],
                    );
                  },
                  empty: () => const SizedBox.shrink(),
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),

            Expanded(
              child: Column(
                children: [
                  AsyncWidget<TodaysSessionState>(
                    data: todaysSessionState,
                    minHeight: 80,
                    builder: (sessionState) {
                      // Find main_workout content
                      final mainWorkoutContent = sessionState.when(
                        empty: () => null,
                        restDay: () => null,
                        trainingDay: (sections, coachQuote, coachName) {
                          final mainWorkoutSection = sections.firstWhere(
                            (section) => section.title == 'main_workout',
                            orElse: () => sections.isNotEmpty
                                ? sections.first
                                : const BlueprintSectionEntity(
                                    id: '',
                                    sectionId: '',
                                    title: '',
                                    content: '',
                                    orderIndex: 0,
                                    isCompleted: false,
                                    isRecordable: false,
                                  ),
                          );
                          return mainWorkoutSection.content;
                        },
                      );

                      return LeaderboardSessionBox(
                        description: mainWorkoutContent ?? '오늘의 세션',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: AsyncWidget<List<LeaderboardEntryEntity>>(
                      data: ref.watch(leaderboardProvider(selectedDate)),
                      builder: (entries) {
                        return LogLeaderBoardWidget(
                          entries: entries,
                          emptyStateText: l10n.noLeaderboardEntries,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
