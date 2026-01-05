import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_date_provider.g.dart';

/// 선택한 날짜를 관리하는 Provider
/// 여러 페이지에서 공유하여 사용
@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  DateTime build() {
    // 오늘 날짜를 기본값으로 사용
    final today = DateTime.now();
    return DateTime(today.year, today.month, today.day);
  }

  /// 날짜 변경
  void setDate(DateTime date) {
    state = DateTime(date.year, date.month, date.day);
  }

  /// 오늘 날짜로 이동
  void setToday() {
    final today = DateTime.now();
    state = DateTime(today.year, today.month, today.day);
  }
}
