import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_date_provider.g.dart';

/// 홈 화면에서 선택된 날짜 상태 관리
@riverpod
class SelectedDateNotifier extends _$SelectedDateNotifier {
  @override
  DateTime build() => DateTime.now();

  void setSelectedDate(DateTime date) => state = date;
}
