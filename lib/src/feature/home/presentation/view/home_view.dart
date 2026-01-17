import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/program_selector.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(12),
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

              // 현재 등록된 프로그램의 이름과 설명이 나오고 클릭하면 바텀시트에 내가 가지고 있는 프로그램 목록이 나옴
              ProgramSelector(
                programList: [],
                selectedProgram: null,
                onSelected: (program) {},
              ),

              // 운동 세션 내용
            ],
          ),
        ),
      ),
    );
  }
}
