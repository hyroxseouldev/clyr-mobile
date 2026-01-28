// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 UseCase 프로바이더

@ProviderFor(getActiveProgramUseCase)
final getActiveProgramUseCaseProvider = GetActiveProgramUseCaseProvider._();

/// 홈 UseCase 프로바이더

final class GetActiveProgramUseCaseProvider
    extends
        $FunctionalProvider<
          GetActiveProgramUseCase,
          GetActiveProgramUseCase,
          GetActiveProgramUseCase
        >
    with $Provider<GetActiveProgramUseCase> {
  /// 홈 UseCase 프로바이더
  GetActiveProgramUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getActiveProgramUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getActiveProgramUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetActiveProgramUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetActiveProgramUseCase create(Ref ref) {
    return getActiveProgramUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetActiveProgramUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetActiveProgramUseCase>(value),
    );
  }
}

String _$getActiveProgramUseCaseHash() =>
    r'cda90562ffcd609497e8f3f5e15823b99bdcba2d';

/// 오늘의 세션 조회 UseCase 프로바이더

@ProviderFor(getTodaysSessionUseCase)
final getTodaysSessionUseCaseProvider = GetTodaysSessionUseCaseProvider._();

/// 오늘의 세션 조회 UseCase 프로바이더

final class GetTodaysSessionUseCaseProvider
    extends
        $FunctionalProvider<
          GetTodaysSessionUseCase,
          GetTodaysSessionUseCase,
          GetTodaysSessionUseCase
        >
    with $Provider<GetTodaysSessionUseCase> {
  /// 오늘의 세션 조회 UseCase 프로바이더
  GetTodaysSessionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getTodaysSessionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getTodaysSessionUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetTodaysSessionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetTodaysSessionUseCase create(Ref ref) {
    return getTodaysSessionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetTodaysSessionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetTodaysSessionUseCase>(value),
    );
  }
}

String _$getTodaysSessionUseCaseHash() =>
    r'b4ff783e9553d3898093c18283b22a14c362378a';

/// 섹션 완료 기록 생성 UseCase 프로바이더

@ProviderFor(createSectionRecordUseCase)
final createSectionRecordUseCaseProvider =
    CreateSectionRecordUseCaseProvider._();

/// 섹션 완료 기록 생성 UseCase 프로바이더

final class CreateSectionRecordUseCaseProvider
    extends
        $FunctionalProvider<
          CreateSectionRecordUseCase,
          CreateSectionRecordUseCase,
          CreateSectionRecordUseCase
        >
    with $Provider<CreateSectionRecordUseCase> {
  /// 섹션 완료 기록 생성 UseCase 프로바이더
  CreateSectionRecordUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createSectionRecordUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createSectionRecordUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateSectionRecordUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateSectionRecordUseCase create(Ref ref) {
    return createSectionRecordUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateSectionRecordUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateSectionRecordUseCase>(value),
    );
  }
}

String _$createSectionRecordUseCaseHash() =>
    r'56019c783ff8ebf73cd63f625ed67a6f22400198';
