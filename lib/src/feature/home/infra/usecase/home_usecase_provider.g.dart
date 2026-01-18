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

/// Blueprint 섹션 조회 UseCase 프로바이더

@ProviderFor(getBlueprintSectionsUseCase)
final getBlueprintSectionsUseCaseProvider =
    GetBlueprintSectionsUseCaseProvider._();

/// Blueprint 섹션 조회 UseCase 프로바이더

final class GetBlueprintSectionsUseCaseProvider
    extends
        $FunctionalProvider<
          GetBlueprintSectionsUseCase,
          GetBlueprintSectionsUseCase,
          GetBlueprintSectionsUseCase
        >
    with $Provider<GetBlueprintSectionsUseCase> {
  /// Blueprint 섹션 조회 UseCase 프로바이더
  GetBlueprintSectionsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getBlueprintSectionsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getBlueprintSectionsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetBlueprintSectionsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetBlueprintSectionsUseCase create(Ref ref) {
    return getBlueprintSectionsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetBlueprintSectionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetBlueprintSectionsUseCase>(value),
    );
  }
}

String _$getBlueprintSectionsUseCaseHash() =>
    r'0afa83f862349fab5d7141dc6b068349bbc87f29';

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
