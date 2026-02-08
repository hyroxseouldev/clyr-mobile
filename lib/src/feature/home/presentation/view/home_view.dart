import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/onboarding_controller.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/blueprint_section_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/blueprint_section_card.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/coach_profile_card_widget.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/program_progress_bar_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selector/date_selector_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/coach_quote_widget.dart';

// View State ( 날짜 )
// Needed Data ( 코치이름 ,코치 프로필 아바타, 프로그램 명, 프로그램 기간, 진척도, 블루프린트 코치의 한마디 )
class HomeView extends ConsumerWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = ref.watch(selectedDateProvider);

    // Calculate minimum height for centered loader
    final screenHeight = MediaQuery.of(context).size.height;
    final loaderMinHeight = screenHeight * 0.75;

    // 현재 활성화된 프로그램 상태 감지
    final activeProgramState = ref.watch(homeControllerProvider);

    // Watch onboarding status and redirect if not completed
    ref.listen<AsyncValue<bool>>(checkOnboardingStatusProvider, (
      previous,
      next,
    ) {
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
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 현재 등록된 프로그램 표시
                AsyncWidget<ActiveProgramEntity>(
                  data: activeProgramState,
                  minHeight: loaderMinHeight,
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
                            DateSelectorWidget(
                              initialDate: selectedDate,
                              onDateSelected: (date) {
                                ref
                                    .read(selectedDateProvider.notifier)
                                    .setSelectedDate(date);
                              },
                            ),

                            CoachProfileCard(
                              profileUrl: coachProfileUrl,
                              coachName: coachName,
                              programName: title,
                              subtitleText: l10n.trainingWithCoach(coachName),
                            ),
                            const SizedBox(height: 20),
                            ProgramProgressBar(
                              startDate: startDate,
                              endDate: endDate,
                              today: DateTime.now(),
                              completedText: l10n.completed,
                            ),
                          ],
                        );
                      },
                      empty: () => _buildEmptyProgramState(context),
                      orElse: () => _buildEmptyProgramState(context),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // Blueprint sections list
                AsyncWidget<TodaysSessionState>(
                  data: ref.watch(todaysSessionStateProvider(selectedDate)),
                  minHeight: loaderMinHeight,
                  builder: (sessionState) {
                    return sessionState.when(
                      empty: () => const SizedBox.shrink(),
                      restDay: () => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.todaysSections,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          _buildRestDayState(context),
                        ],
                      ),
                      trainingDay: (sections, coachQuote, coachName) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CoachQuoteWidget(
                              title: l10n.coachQuoteTitle(coachName),
                              content: coachQuote,
                              enableNewLines: false,
                            ),
                            const SizedBox(height: 24),
                            Text(
                              l10n.todaysSections,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            Column(
                              children: sections.asMap().entries.map((entry) {
                                final index = entry.key;
                                final item = entry.value;
                                return BlueprintSectionCard(
                                  item: item,
                                  index: index + 1,
                                  isCompleted: entry.value.isCompleted,
                                  showingCompleteButton:
                                      entry.value.isRecordable,
                                  completedText: l10n.completed,
                                  completeWorkoutText: l10n.completeWorkout,
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      },
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

  Widget _buildRestDayState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.self_improvement, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              l10n.restDay,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyProgramState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noProgramsRegistered,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.addNewProgram,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
