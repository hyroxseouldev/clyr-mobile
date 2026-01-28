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

  /// Whether this date is enabled (within valid date range)
  final bool isEnabled;

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
    this.isEnabled = true,
    this.onTap,
    this.width,
    this.height,
    this.borderRadius = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context);

    // Only show as selected if both selected AND enabled
    final effectivelySelected = isSelected && isEnabled;

    // Determine text color based on weekday, selection state, and enabled state
    Color getTextColor() {
      if (!isEnabled) {
        return Colors.grey.withValues(alpha: 0.4);
      }
      if (effectivelySelected) {
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

    return Opacity(
      opacity: isEnabled ? 1.0 : 0.4,
      child: GestureDetector(
        onTap: isEnabled ? onTap : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: effectivelySelected
                ? theme.colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(borderRadius),
            // Shadow effect for selected state
            boxShadow: effectivelySelected
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
                DateFormat('E', locale.languageCode).format(date),
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
      ),
    );
  }
}
