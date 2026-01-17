import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'date_range_calculator.dart';
import 'date_selection_item.dart';
import 'date_selection_type.dart';

/// Date selection widget with weekly and monthly display modes
///
/// Example usage:
/// ```dart
/// // Weekly mode - current week
/// DateSelectionWidget(
///   showType: DateSelectionType.weekly,
///   selectedDate: selectedDate,
///   onDateSelected: (date) => setState(() => selectedDate = date),
/// )
///
/// // Monthly mode - specific month (calendar-style grid)
/// DateSelectionWidget(
///   showType: DateSelectionType.monthly,
///   startDate: DateTime(2026, 2, 1),
///   selectedDate: selectedDate,
///   onDateSelected: (date) => setState(() => selectedDate = date),
/// )
/// ```
class DateSelectionWidget extends HookWidget {
  /// Currently selected date
  final DateTime? selectedDate;

  /// Display mode (weekly or monthly)
  final DateSelectionType showType;

  /// Start date of range (null = auto-calculate from today)
  final DateTime? startDate;

  /// End date of range (null = no upper limit)
  final DateTime? endDate;

  /// Callback when a date is selected
  final ValueChanged<DateTime>? onDateSelected;

  /// Container padding
  final EdgeInsetsGeometry? padding;

  /// Item width (for responsive sizing)
  final double? itemWidth;

  /// Item height (for responsive sizing)
  final double? itemHeight;

  /// Border radius for items (default 18px)
  final double? itemBorderRadius;

  const DateSelectionWidget({
    super.key,
    required this.showType,
    this.selectedDate,
    this.startDate,
    this.endDate,
    this.onDateSelected,
    this.padding,
    this.itemWidth,
    this.itemHeight,
    this.itemBorderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Calculate date range based on showType and optional boundaries
    final dates = useMemoized(
      () => DateRangeCalculator.calculateRange(
        showType: showType,
        startDate: startDate,
        endDate: endDate,
      ),
      [showType, startDate, endDate],
    );

    // Calculate responsive item width for weekly mode
    final screenWidth = MediaQuery.of(context).size.width;
    final defaultPadding =
        padding ?? const EdgeInsets.symmetric(horizontal: 4, vertical: 12);
    final horizontalPadding = defaultPadding.horizontal;

    // Use 98.5% of available width to ensure 7 items fit and fill the space
    final availableWidth = screenWidth - horizontalPadding;
    final safeWidth =
        availableWidth * 0.985; // Use 98.5% to fill space with small margin
    final responsiveItemWidth =
        itemWidth ??
        (showType == DateSelectionType.weekly
            ? safeWidth /
                  7 // Always shows 7 items
            : (screenWidth - horizontalPadding - 32) /
                  7); // 32 = margins for monthly

    final responsiveItemHeight = itemHeight ?? 70.0;

    return Container(
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? const Color(0xFF121621)
            : theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(
        vertical: (defaultPadding as EdgeInsets).vertical,
      ), // Only vertical padding
      child: showType == DateSelectionType.weekly
          ? _buildWeeklyMode(
              context,
              dates,
              responsiveItemWidth,
              responsiveItemHeight,
            )
          : _buildMonthlyMode(
              context,
              dates,
              responsiveItemWidth,
              responsiveItemHeight,
            ),
    );
  }

  /// Build weekly mode with horizontal scrollable list
  Widget _buildWeeklyMode(
    BuildContext context,
    List<DateTime> dates,
    double itemWidth,
    double itemHeight,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate initial scroll offset to center the first 7 items
    // Account for ListView padding (2px total: 1px left + 1px right)
    final totalWidth = (7 * itemWidth); // 7 items + ListView padding
    final initialOffset = (totalWidth - screenWidth) / 2;

    final scrollController = useScrollController(
      initialScrollOffset: initialOffset > 0 ? initialOffset : 0,
    );

    // Auto-scroll to selected date when it changes
    useEffect(() {
      if (selectedDate != null && dates.isNotEmpty) {
        final selectedIndex = dates.indexWhere(
          (date) => DateRangeCalculator.isSameDay(date, selectedDate!),
        );

        if (selectedIndex != -1) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Check if controller is attached to a scrollable widget
            if (!scrollController.hasClients) return;

            // Add 1 for ListView left padding
            final targetPosition =
                (selectedIndex * itemWidth) +
                (itemWidth / 2) -
                (screenWidth / 2) +
                1;

            scrollController.animateTo(
              targetPosition.clamp(
                0.0,
                scrollController.position.maxScrollExtent,
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        }
      }
      return null;
    }, [selectedDate, dates, screenWidth]);

    return SizedBox(
      height: itemHeight,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 1, right: 1),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected =
              selectedDate != null &&
              DateRangeCalculator.isSameDay(date, selectedDate!);
          final isToday = DateRangeCalculator.isSameDay(date, DateTime.now());

          return SizedBox(
            width: itemWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: DateSelectionItem(
                date: date,
                isSelected: isSelected,
                isToday: isToday,
                width: itemWidth - 2,
                height: itemHeight,
                borderRadius: itemBorderRadius ?? 18.0,
                onTap: () => onDateSelected?.call(date),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Build monthly mode with calendar-style grid layout
  Widget _buildMonthlyMode(
    BuildContext context,
    List<DateTime> dates,
    double itemWidth,
    double itemHeight,
  ) {
    if (dates.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('날짜가 없습니다')),
      );
    }

    // Group dates by week (7 days per row)
    final weeks = <List<DateTime>>[];
    for (int i = 0; i < dates.length; i += 7) {
      final end = (i + 7 < dates.length) ? i + 7 : dates.length;
      weeks.add(dates.sublist(i, end));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: weeks.map((weekDates) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: weekDates.map((date) {
              final isSelected =
                  selectedDate != null &&
                  DateRangeCalculator.isSameDay(date, selectedDate!);
              final isToday = DateRangeCalculator.isSameDay(
                date,
                DateTime.now(),
              );

              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: DateSelectionItem(
                    date: date,
                    isSelected: isSelected,
                    isToday: isToday,
                    width: itemWidth,
                    height: itemHeight,
                    borderRadius: itemBorderRadius ?? 18.0,
                    onTap: () => onDateSelected?.call(date),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
