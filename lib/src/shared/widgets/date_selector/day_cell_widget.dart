import 'package:flutter/material.dart';

/// Individual day cell widget for date selection.
///
/// Displays the day name (abbreviated) and day number.
/// Provides visual feedback when selected.
class DayCellWidget extends StatelessWidget {
  const DayCellWidget({
    required this.date,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  /// The date to display
  final DateTime date;

  /// Whether this day is currently selected
  final bool isSelected;

  /// Callback when this day is tapped
  final VoidCallback onTap;

  /// Weekday abbreviations (Mon=1, Tue=2, ..., Sun=7)
  static const _weekdays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Get day name and day number without DateFormat
    final dayName = _weekdays[date.weekday - 1]; // weekday: Mon=1, Sun=7
    final dayNumber = date.day.toString();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 48,
        height: 64,
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: !isSelected
              ? Border.all(
                  color: theme.colorScheme.outline.withOpacity(0.3),
                  width: 1,
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Day name (Mon, Tue, etc.)
            Text(
              dayName,
              style: theme.textTheme.labelSmall?.copyWith(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface.withOpacity(0.6),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            // Day number (1-31)
            Text(
              dayNumber,
              style: theme.textTheme.titleMedium?.copyWith(
                color: isSelected
                    ? theme.colorScheme.onPrimary
                    : theme.colorScheme.onSurface,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
