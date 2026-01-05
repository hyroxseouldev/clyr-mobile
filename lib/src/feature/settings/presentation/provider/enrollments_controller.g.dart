// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enrollments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 등록 목록 컨트롤러
///
/// 페이지네이션을 지원하는 등록 목록 조회

@ProviderFor(EnrollmentsController)
final enrollmentsControllerProvider = EnrollmentsControllerProvider._();

/// 등록 목록 컨트롤러
///
/// 페이지네이션을 지원하는 등록 목록 조회
final class EnrollmentsControllerProvider
    extends
        $AsyncNotifierProvider<
          EnrollmentsController,
          PaginatedData<EnrollmentEntity>
        > {
  /// 등록 목록 컨트롤러
  ///
  /// 페이지네이션을 지원하는 등록 목록 조회
  EnrollmentsControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'enrollmentsControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$enrollmentsControllerHash();

  @$internal
  @override
  EnrollmentsController create() => EnrollmentsController();
}

String _$enrollmentsControllerHash() =>
    r'0b050780cedbfa158e44230d99a959e5984e31c8';

/// 등록 목록 컨트롤러
///
/// 페이지네이션을 지원하는 등록 목록 조회

abstract class _$EnrollmentsController
    extends $AsyncNotifier<PaginatedData<EnrollmentEntity>> {
  FutureOr<PaginatedData<EnrollmentEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<PaginatedData<EnrollmentEntity>>,
              PaginatedData<EnrollmentEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<PaginatedData<EnrollmentEntity>>,
                PaginatedData<EnrollmentEntity>
              >,
              AsyncValue<PaginatedData<EnrollmentEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
