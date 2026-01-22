import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_type.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selection/date_selection_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';

class LogView extends ConsumerWidget {
  const LogView({super.key});
  static const String routeName = 'log';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                DateSelectionWidget(
                  showType: DateSelectionType.weekly,
                  selectedDate: selectedDate,
                  onDateSelected: (date) {
                    ref
                        .read(selectedDateProvider.notifier)
                        .setSelectedDate(date);
                  },
                ),
                Text('Log'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
