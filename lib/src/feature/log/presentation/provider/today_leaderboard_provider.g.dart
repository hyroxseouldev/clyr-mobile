// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_leaderboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 오늘 리더보드 Provider
///
/// 지정된 날짜의 리더보드 데이터를 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

@ProviderFor(todayLeaderboard)
final todayLeaderboardProvider = TodayLeaderboardFamily._();

/// 오늘 리더보드 Provider
///
/// 지정된 날짜의 리더보드 데이터를 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class TodayLeaderboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<TodayLeaderBoardEntity>,
          TodayLeaderBoardEntity,
          FutureOr<TodayLeaderBoardEntity>
        >
    with
        $FutureModifier<TodayLeaderBoardEntity>,
        $FutureProvider<TodayLeaderBoardEntity> {
  /// 오늘 리더보드 Provider
  ///
  /// 지정된 날짜의 리더보드 데이터를 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.
  TodayLeaderboardProvider._({
    required TodayLeaderboardFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'todayLeaderboardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$todayLeaderboardHash();

  @override
  String toString() {
    return r'todayLeaderboardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TodayLeaderBoardEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TodayLeaderBoardEntity> create(Ref ref) {
    final argument = this.argument as DateTime;
    return todayLeaderboard(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TodayLeaderboardProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todayLeaderboardHash() => r'f8d4820046dc7435a6a3a2ab6b01a7e4d45b9e14';

/// 오늘 리더보드 Provider
///
/// 지정된 날짜의 리더보드 데이터를 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class TodayLeaderboardFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TodayLeaderBoardEntity>, DateTime> {
  TodayLeaderboardFamily._()
    : super(
        retry: null,
        name: r'todayLeaderboardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 오늘 리더보드 Provider
  ///
  /// 지정된 날짜의 리더보드 데이터를 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.

  TodayLeaderboardProvider call(DateTime date) =>
      TodayLeaderboardProvider._(argument: date, from: this);

  @override
  String toString() => r'todayLeaderboardProvider';
}
