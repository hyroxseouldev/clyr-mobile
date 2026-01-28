// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 리더보드 조회 UseCase 프로바이더

@ProviderFor(getLeaderboardUseCase)
final getLeaderboardUseCaseProvider = GetLeaderboardUseCaseProvider._();

/// 리더보드 조회 UseCase 프로바이더

final class GetLeaderboardUseCaseProvider
    extends
        $FunctionalProvider<
          GetLeaderboardUseCase,
          GetLeaderboardUseCase,
          GetLeaderboardUseCase
        >
    with $Provider<GetLeaderboardUseCase> {
  /// 리더보드 조회 UseCase 프로바이더
  GetLeaderboardUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLeaderboardUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLeaderboardUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetLeaderboardUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetLeaderboardUseCase create(Ref ref) {
    return getLeaderboardUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetLeaderboardUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetLeaderboardUseCase>(value),
    );
  }
}

String _$getLeaderboardUseCaseHash() =>
    r'68592f6c8bfce0b20a30dedaafa92184b8718030';

/// 오늘 리더보드 조회 UseCase 프로바이더

@ProviderFor(getTodayLeaderBoardUseCase)
final getTodayLeaderBoardUseCaseProvider =
    GetTodayLeaderBoardUseCaseProvider._();

/// 오늘 리더보드 조회 UseCase 프로바이더

final class GetTodayLeaderBoardUseCaseProvider
    extends
        $FunctionalProvider<
          GetTodayLeaderBoardUseCase,
          GetTodayLeaderBoardUseCase,
          GetTodayLeaderBoardUseCase
        >
    with $Provider<GetTodayLeaderBoardUseCase> {
  /// 오늘 리더보드 조회 UseCase 프로바이더
  GetTodayLeaderBoardUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTodayLeaderBoardUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTodayLeaderBoardUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTodayLeaderBoardUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTodayLeaderBoardUseCase create(Ref ref) {
    return getTodayLeaderBoardUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTodayLeaderBoardUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTodayLeaderBoardUseCase>(value),
    );
  }
}

String _$getTodayLeaderBoardUseCaseHash() =>
    r'bd88ad4f1ebeb8e00df487e650ab15493a8c5c20';
