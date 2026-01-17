// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 컨트롤러
///
/// 현재 사용자의 활성화된 프로그램을 가져옵니다

@ProviderFor(HomeController)
final homeControllerProvider = HomeControllerProvider._();

/// 홈 컨트롤러
///
/// 현재 사용자의 활성화된 프로그램을 가져옵니다
final class HomeControllerProvider
    extends $AsyncNotifierProvider<HomeController, ActiveProgramEntity?> {
  /// 홈 컨트롤러
  ///
  /// 현재 사용자의 활성화된 프로그램을 가져옵니다
  HomeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeControllerHash();

  @$internal
  @override
  HomeController create() => HomeController();
}

String _$homeControllerHash() => r'28c99462274617cd282b2b54354864e3e5817cbb';

/// 홈 컨트롤러
///
/// 현재 사용자의 활성화된 프로그램을 가져옵니다

abstract class _$HomeController extends $AsyncNotifier<ActiveProgramEntity?> {
  FutureOr<ActiveProgramEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<ActiveProgramEntity?>, ActiveProgramEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ActiveProgramEntity?>,
                ActiveProgramEntity?
              >,
              AsyncValue<ActiveProgramEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
