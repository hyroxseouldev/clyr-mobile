import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/presentation/provider/leaderboard_provider.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.leaderboard,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            DateSelectionWidget(
              showType: DateSelectionType.weekly,
              selectedDate: selectedDate,
              onDateSelected: (date) {
                ref.read(selectedDateProvider.notifier).setSelectedDate(date);
              },
            ),
            Expanded(
              child: AsyncWidget<List<LeaderboardEntryEntity>>(
                data: ref.watch(leaderboardProvider(selectedDate)),
                builder: (entries) {
                  return LogLeaderBoardWidget(entries: entries);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
