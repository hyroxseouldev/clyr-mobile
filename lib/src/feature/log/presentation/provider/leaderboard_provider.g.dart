// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Leaderboard Provider
///
/// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

@ProviderFor(leaderboard)
final leaderboardProvider = LeaderboardFamily._();

/// Leaderboard Provider
///
/// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class LeaderboardProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LeaderboardEntryEntity>>,
          List<LeaderboardEntryEntity>,
          FutureOr<List<LeaderboardEntryEntity>>
        >
    with
        $FutureModifier<List<LeaderboardEntryEntity>>,
        $FutureProvider<List<LeaderboardEntryEntity>> {
  /// Leaderboard Provider
  ///
  /// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.
  LeaderboardProvider._({
    required LeaderboardFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'leaderboardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$leaderboardHash();

  @override
  String toString() {
    return r'leaderboardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<LeaderboardEntryEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LeaderboardEntryEntity>> create(Ref ref) {
    final argument = this.argument as DateTime;
    return leaderboard(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LeaderboardProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$leaderboardHash() => r'6b350de1fed5d8194f3b0b26b5091ea62c8cf6ee';

/// Leaderboard Provider
///
/// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class LeaderboardFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<LeaderboardEntryEntity>>,
          DateTime
        > {
  LeaderboardFamily._()
    : super(
        retry: null,
        name: r'leaderboardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Leaderboard Provider
  ///
  /// 지정된 날짜의 리더보드 엔트리들을 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.

  LeaderboardProvider call(DateTime date) =>
      LeaderboardProvider._(argument: date, from: this);

  @override
  String toString() => r'leaderboardProvider';
}
