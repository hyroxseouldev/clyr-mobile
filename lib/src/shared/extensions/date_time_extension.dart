/// Extension on [DateTime] for week-related calculations.
extension DateTimeExtension on DateTime {
  /// Returns the Sunday (start of week) for this date's week.
  ///
  /// The result is a DateTime at midnight (00:00:00) representing
  /// the Sunday of the week containing this date.
  DateTime get startOfWeek {
    // DateTime.weekday: Mon=1, Tue=2, Wed=3, Thu=4, Fri=5, Sat=6, Sun=7
    // We want Sunday=0, so we need to calculate days to subtract
    final daysFromSunday = weekday % 7;
    return DateTime(year, month, day).subtract(Duration(days: daysFromSunday));
  }

  /// Checks if this date is the same day as [other].
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
