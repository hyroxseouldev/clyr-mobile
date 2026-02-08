import 'package:clyr_mobile/src/shared/widgets/date_selector/day_cell_widget.dart';
import 'package:flutter/material.dart';

/// A single week row displaying 7 days (Sunday through Saturday).
///
/// Takes the Sunday of the week as [weekStartDate] and renders
/// all 7 days of that week in a horizontal row.
class WeekRowWidget extends StatelessWidget {
  const WeekRowWidget({
    required this.weekStartDate,
    required this.selectedDate,
    required this.onDateSelected,
    super.key,
  });

  /// The Sunday (start of week) for this row
  final DateTime weekStartDate;

  /// The currently selected date
  final DateTime selectedDate;

  /// Callback when a day is selected
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        final dayDate = weekStartDate.add(Duration(days: index));
        final isSelected = _isSameDay(dayDate, selectedDate);

        return DayCellWidget(
          date: dayDate,
          isSelected: isSelected,
          onTap: () => onDateSelected(dayDate),
        );
      }),
    );
  }

  /// Checks if two dates are the same day (ignoring time).
  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
