// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blueprint_section_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Blueprint Sections Provider
///
/// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

@ProviderFor(blueprintSections)
final blueprintSectionsProvider = BlueprintSectionsFamily._();

/// Blueprint Sections Provider
///
/// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class BlueprintSectionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<BlueprintSectionEntity>>,
          List<BlueprintSectionEntity>,
          FutureOr<List<BlueprintSectionEntity>>
        >
    with
        $FutureModifier<List<BlueprintSectionEntity>>,
        $FutureProvider<List<BlueprintSectionEntity>> {
  /// Blueprint Sections Provider
  ///
  /// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.
  BlueprintSectionsProvider._({
    required BlueprintSectionsFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'blueprintSectionsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$blueprintSectionsHash();

  @override
  String toString() {
    return r'blueprintSectionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<BlueprintSectionEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<BlueprintSectionEntity>> create(Ref ref) {
    final argument = this.argument as DateTime;
    return blueprintSections(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is BlueprintSectionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$blueprintSectionsHash() => r'3843a0433ae674eb4ce432c68119942bbf850ebe';

/// Blueprint Sections Provider
///
/// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
/// 날짜가 변경되면 자동으로 다시 가져옵니다.

final class BlueprintSectionsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<BlueprintSectionEntity>>,
          DateTime
        > {
  BlueprintSectionsFamily._()
    : super(
        retry: null,
        name: r'blueprintSectionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Blueprint Sections Provider
  ///
  /// 지정된 날짜의 블루프린트 섹션 엔티티들을 가져옵니다.
  /// 날짜가 변경되면 자동으로 다시 가져옵니다.

  BlueprintSectionsProvider call(DateTime date) =>
      BlueprintSectionsProvider._(argument: date, from: this);

  @override
  String toString() => r'blueprintSectionsProvider';
}
