import 'date_selection_type.dart';

/// Utility class for calculating date ranges for date selection widget
class DateRangeCalculator {
  DateRangeCalculator._();

  /// Calculate date range based on showType and optional boundaries
  ///
  /// [showType] - weekly (7 days) or monthly (full month)
  /// [startDate] - Optional start date (null = auto-calculate from today)
  /// [endDate] - Optional end date for truncation
  static List<DateTime> calculateRange({
    required DateSelectionType showType,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    switch (showType) {
      case DateSelectionType.weekly:
        return _calculateWeeklyRange(startDate, endDate);
      case DateSelectionType.monthly:
        return _calculateMonthlyRange(startDate, endDate);
    }
  }

  /// Calculate weekly range with full startDate to endDate
  static List<DateTime> _calculateWeeklyRange(
    DateTime? start,
    DateTime? end,
  ) {
    final DateTime baseDate;
    final DateTime finalEndDate;

    if (start != null && end != null) {
      // Both start and end provided: use full range
      baseDate = DateTime(start.year, start.month, start.day);
      finalEndDate = DateTime(end.year, end.month, end.day);
    } else if (start != null) {
      // Only start provided: use 30 days default range
      baseDate = DateTime(start.year, start.month, start.day);
      finalEndDate = baseDate.add(const Duration(days: 30));
    } else if (end != null) {
      // Only end provided: 30 days before end
      finalEndDate = DateTime(end.year, end.month, end.day);
      baseDate = finalEndDate.subtract(const Duration(days: 30));
    } else {
      // Neither provided: today ± 15 days (31 days total)
      final today = DateTime.now();
      baseDate = DateTime(today.year, today.month, today.day - 15);
      finalEndDate = DateTime(today.year, today.month, today.day + 15);
    }

    // Calculate day difference and generate all dates in range
    final dayDifference = finalEndDate.difference(baseDate).inDays + 1;

    return List.generate(
      dayDifference > 0 ? dayDifference : 0,
      (index) => baseDate.add(Duration(days: index)),
    );
  }

  /// Calculate full month range
  static List<DateTime> _calculateMonthlyRange(
    DateTime? start,
    DateTime? end,
  ) {
    final DateTime baseDate;

    if (start != null) {
      baseDate = DateTime(start.year, start.month, 1);
    } else {
      final today = DateTime.now();
      baseDate = DateTime(today.year, today.month, 1);
    }

    // Calculate days in month
    final daysInMonth =
        DateTime(baseDate.year, baseDate.month + 1, 0).day;

    // Generate all days in month
    final dates = List.generate(
      daysInMonth,
      (index) => DateTime(baseDate.year, baseDate.month, index + 1),
    );

    // Apply end date truncation if provided
    if (end != null) {
      final normalizedEnd = DateTime(end.year, end.month, end.day);
      return dates.where((date) => !date.isAfter(normalizedEnd)).toList();
    }

    return dates;
  }

  /// Check if two dates are same day (ignoring time)
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// Check if a date is within range (inclusive)
  static bool isInRange(
    DateTime date,
    DateTime? start,
    DateTime? end,
  ) {
    if (start != null && date.isBefore(DateTime(start.year, start.month, start.day))) {
      return false;
    }
    if (end != null && date.isAfter(DateTime(end.year, end.month, end.day))) {
      return false;
    }
    return true;
  }

  /// Get the start of the week for a given date
  /// [weekStartDay] = 1 for Monday, 7 for Sunday (DateTime weekday values)
  static DateTime getWeekStart(DateTime date, int weekStartDay) {
    final currentWeekday = date.weekday; // 1=Monday, 7=Sunday
    final daysToSubtract = (currentWeekday - weekStartDay + 7) % 7;
    return DateTime(date.year, date.month, date.day - daysToSubtract);
  }

  /// Calculate list of week start dates from a date range
  static List<DateTime> calculateWeekStarts(
    List<DateTime> dates,
    int weekStartDay,
  ) {
    if (dates.isEmpty) return [];

    final weekStarts = <DateTime>[];
    DateTime currentWeekStart = getWeekStart(dates.first, weekStartDay);

    final lastDate = dates.last;
    while (currentWeekStart.isBefore(lastDate) ||
        currentWeekStart.isAtSameMomentAs(lastDate)) {
      weekStarts.add(currentWeekStart);
      currentWeekStart = currentWeekStart.add(const Duration(days: 7));
    }

    return weekStarts;
  }

  /// Get 7 days for a week starting from the given date
  static List<DateTime> getWeekDays(DateTime weekStart) {
    return List.generate(
      7,
      (index) => weekStart.add(Duration(days: index)),
    );
  }
}
