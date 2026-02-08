import 'package:clyr_mobile/src/shared/extensions/date_time_extension.dart';
import 'package:clyr_mobile/src/shared/widgets/date_selector/week_row_widget.dart';
import 'package:flutter/material.dart';

/// A week-based date selection widget with horizontal scrolling.
///
/// Features:
/// - Displays 7 days per row (Sunday through Saturday)
/// - PageView with snap-to-week scrolling
/// - Visual selection indicator
/// - Callback for date selection
///
/// Example usage:
/// ```dart
/// DateSelectorWidget(
///   initialDate: DateTime.now(),
///   onDateSelected: (date) => print('Selected: $date'),
/// )
/// ```
class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({
    required this.initialDate,
    required this.onDateSelected,
    super.key,
  });

  /// The initially selected date
  final DateTime initialDate;

  /// Callback when a date is selected
  final ValueChanged<DateTime> onDateSelected;

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  late PageController _pageController;
  late DateTime _selectedDate;
  static final _epochSunday = DateTime(2020, 1, 5); // Sunday, Jan 5 2020

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;

    // Calculate initial page index based on weeks from epoch
    final initialPage = _calculatePageIndex(widget.initialDate);
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// Calculate the page index for a given date.
  ///
  /// Uses a reference epoch Sunday to calculate absolute week index.
  int _calculatePageIndex(DateTime date) {
    final weekStart = date.startOfWeek;
    final daysDifference = weekStart.difference(_epochSunday).inDays;
    return daysDifference ~/ 7;
  }

  /// Get the week start (Sunday) date for a given page index.
  DateTime _getWeekStartFromIndex(int index) {
    return _epochSunday.add(Duration(days: index * 7));
  }

  void _handleDateSelected(DateTime date) {
    setState(() => _selectedDate = date);
    widget.onDateSelected(date);
  }

  /// Format the date for display.
  String _formatDate(DateTime date) {
    return '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 80,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              // Optional: Track current week for external use
              // Could add a callback parameter in the future
            },
            itemBuilder: (context, index) {
              final weekStart = _getWeekStartFromIndex(index);
              return WeekRowWidget(
                weekStartDate: weekStart,
                selectedDate: _selectedDate,
                onDateSelected: _handleDateSelected,
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Text(
          _formatDate(_selectedDate),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
