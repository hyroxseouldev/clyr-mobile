import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Individual date item widget for date selection
class DateSelectionItem extends StatelessWidget {
  /// Date to display
  final DateTime date;

  /// Whether this date is currently selected
  final bool isSelected;

  /// Whether this date is today
  final bool isToday;

  /// Callback when item is tapped
  final VoidCallback? onTap;

  /// Item width (optional, for responsive sizing)
  final double? width;

  /// Item height (optional, for responsive sizing)
  final double? height;

  /// Border radius (default 18px)
  final double borderRadius;

  const DateSelectionItem({
    super.key,
    required this.date,
    required this.isSelected,
    this.isToday = false,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Determine text color based on weekday and selection state
    Color getTextColor() {
      if (isSelected) {
        return theme.colorScheme.onPrimary;
      }

      // Saturday (6) = blue, Sunday (7) = red
      if (date.weekday == 6) {
        return Colors.blue;
      } else if (date.weekday == 7) {
        return Colors.red;
      }

      return theme.colorScheme.onSurface.withValues(alpha: 0.6);
    }

    final textColor = getTextColor();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          // Shadow effect for selected state
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Weekday label (top)
            Text(
              DateFormat('E', 'ko').format(date),
              style: theme.textTheme.labelSmall?.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            const SizedBox(height: 4),

            // Date number (bottom)
            Text(
              '${date.day}',
              style: theme.textTheme.titleLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
