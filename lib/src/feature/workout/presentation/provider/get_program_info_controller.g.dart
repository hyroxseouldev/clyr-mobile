// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_program_info_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Program 정보 조회 컨트롤러
///
/// 현재 사용자의 활성화된 enrollments의 program 정보를 반환

@ProviderFor(GetProgramInfoController)
final getProgramInfoControllerProvider = GetProgramInfoControllerProvider._();

/// Program 정보 조회 컨트롤러
///
/// 현재 사용자의 활성화된 enrollments의 program 정보를 반환
final class GetProgramInfoControllerProvider
    extends
        $AsyncNotifierProvider<GetProgramInfoController, List<ProgramEntity>> {
  /// Program 정보 조회 컨트롤러
  ///
  /// 현재 사용자의 활성화된 enrollments의 program 정보를 반환
  GetProgramInfoControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getProgramInfoControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getProgramInfoControllerHash();

  @$internal
  @override
  GetProgramInfoController create() => GetProgramInfoController();
}

String _$getProgramInfoControllerHash() =>
    r'7027e10c34a71de3b5c2f5a85e889b750e68e675';

/// Program 정보 조회 컨트롤러
///
/// 현재 사용자의 활성화된 enrollments의 program 정보를 반환

abstract class _$GetProgramInfoController
    extends $AsyncNotifier<List<ProgramEntity>> {
  FutureOr<List<ProgramEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ProgramEntity>>, List<ProgramEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ProgramEntity>>, List<ProgramEntity>>,
              AsyncValue<List<ProgramEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
