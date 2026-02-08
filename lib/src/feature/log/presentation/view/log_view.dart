import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/home_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/presentation/provider/today_leaderboard_provider.dart';
import 'package:clyr_mobile/src/feature/log/presentation/widget/leaderboard_session_box.dart';
import 'package:clyr_mobile/src/feature/log/presentation/widget/log_leader_board_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selector/date_selector_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogView extends ConsumerWidget {
  const LogView({super.key});
  static const String routeName = 'log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = ref.watch(selectedDateProvider);
    final activeProgramState = ref.watch(homeControllerProvider);
    final todayLeaderBoardState = ref.watch(
      todayLeaderboardProvider(selectedDate),
    );
    final currentUser = Supabase.instance.client.auth.currentUser;

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
                        DateSelectorWidget(
                          initialDate: selectedDate,
                          onDateSelected: (date) {
                            ref
                                .read(selectedDateProvider.notifier)
                                .setSelectedDate(date);
                          },
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
                  AsyncWidget<TodayLeaderBoardEntity>(
                    data: todayLeaderBoardState,
                    minHeight: 80,
                    builder: (leaderboard) {
                      return LeaderboardSessionBox(
                        description: leaderboard.sectionContent ?? '오늘의 세션',
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: AsyncWidget<TodayLeaderBoardEntity>(
                      data: todayLeaderBoardState,
                      builder: (leaderboard) {
                        return LogLeaderBoardWidget(
                          entries: leaderboard.entries,
                          currentUserId: currentUser?.id,
                          mySectionRecordId: leaderboard.mySectionRecordId,
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
