import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

/// 가로 스크롤 가능한 날짜 선택 위젯
class DateSelector extends HookWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const DateSelector({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  void _scrollToToday(ScrollController controller) {
    // 오늘 날짜는 인덱스 7 (-7부터 시작하므로)
    const todayIndex = 7;
    // 아이템 너비(60) + margin(horizontal 4 * 2) = 68
    const itemWidth = 68.0;
    // 화면 너비의 절반에서 아이템 너비의 절반을 뺀 만큼 스크롤
    final viewportWidth = controller.position.viewportDimension;
    final targetOffset =
        (todayIndex * itemWidth) - (viewportWidth / 2) + (itemWidth / 2);

    controller.animateTo(
      targetOffset.clamp(0.0, controller.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List<DateTime> _generateDateRange() {
    final today = DateTime.now();
    final dates = <DateTime>[];
    // 오늘부터 앞으로 30일까지 표시
    for (int i = -7; i < 30; i++) {
      dates.add(
        DateTime(today.year, today.month, today.day).add(Duration(days: i)),
      );
    }
    return dates;
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    final dates = _generateDateRange();
    final now = DateTime.now();
    final scrollController = useScrollController();

    // 첫 렌더링 후 오늘 날짜가 가운데 오도록 스크롤
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToToday(scrollController);
      });
      return null;
    }, []);

    return SizedBox(
      height: 80,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final date = dates[index];
          final isSelected = _isSameDay(date, selectedDate);
          final isToday = _isSameDay(date, now);

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : isToday
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected || isToday
                      ? Colors.transparent
                      : Colors.grey.shade300,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 요일
                  Text(
                    DateFormat('E', 'ko').format(date),
                    style: TextStyle(
                      fontSize: 12,
                      color: isSelected
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 날짜
                  Text(
                    '${date.day}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                  const SizedBox(height: 2),
                  // 오늘 표시
                  if (isToday && !isSelected)
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
