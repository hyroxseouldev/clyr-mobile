// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_section_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 오늘의 세션 상태 Provider
///
/// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
/// - empty: 활성화된 프로그램 없음
/// - trainingDay: 훈련일 (세션 리스트 있음)
/// - restDay: 휴식일 (세션 없음)

@ProviderFor(todaysSessionState)
final todaysSessionStateProvider = TodaysSessionStateFamily._();

/// 오늘의 세션 상태 Provider
///
/// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
/// - empty: 활성화된 프로그램 없음
/// - trainingDay: 훈련일 (세션 리스트 있음)
/// - restDay: 휴식일 (세션 없음)

final class TodaysSessionStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<TodaysSessionState>,
          TodaysSessionState,
          FutureOr<TodaysSessionState>
        >
    with
        $FutureModifier<TodaysSessionState>,
        $FutureProvider<TodaysSessionState> {
  /// 오늘의 세션 상태 Provider
  ///
  /// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
  /// - empty: 활성화된 프로그램 없음
  /// - trainingDay: 훈련일 (세션 리스트 있음)
  /// - restDay: 휴식일 (세션 없음)
  TodaysSessionStateProvider._({
    required TodaysSessionStateFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'todaysSessionStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$todaysSessionStateHash();

  @override
  String toString() {
    return r'todaysSessionStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<TodaysSessionState> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<TodaysSessionState> create(Ref ref) {
    final argument = this.argument as DateTime;
    return todaysSessionState(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TodaysSessionStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todaysSessionStateHash() =>
    r'96008116be7a889aaebb8608c9d75d9acc90b386';

/// 오늘의 세션 상태 Provider
///
/// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
/// - empty: 활성화된 프로그램 없음
/// - trainingDay: 훈련일 (세션 리스트 있음)
/// - restDay: 휴식일 (세션 없음)

final class TodaysSessionStateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<TodaysSessionState>, DateTime> {
  TodaysSessionStateFamily._()
    : super(
        retry: null,
        name: r'todaysSessionStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 오늘의 세션 상태 Provider
  ///
  /// ActiveProgram 상태에 따라 오늘의 세션 상태를 반환합니다:
  /// - empty: 활성화된 프로그램 없음
  /// - trainingDay: 훈련일 (세션 리스트 있음)
  /// - restDay: 휴식일 (세션 없음)

  TodaysSessionStateProvider call(DateTime date) =>
      TodaysSessionStateProvider._(argument: date, from: this);

  @override
  String toString() => r'todaysSessionStateProvider';
}
