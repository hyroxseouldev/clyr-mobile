// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 사용자 프로필 컨트롤러

@ProviderFor(UserProfileController)
final userProfileControllerProvider = UserProfileControllerProvider._();

/// 사용자 프로필 컨트롤러
final class UserProfileControllerProvider
    extends $AsyncNotifierProvider<UserProfileController, UserProfileEntity> {
  /// 사용자 프로필 컨트롤러
  UserProfileControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProfileControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userProfileControllerHash();

  @$internal
  @override
  UserProfileController create() => UserProfileController();
}

String _$userProfileControllerHash() =>
    r'ff27e4f923fdb58c944f01969f7275de5d2c95b7';

/// 사용자 프로필 컨트롤러

abstract class _$UserProfileController
    extends $AsyncNotifier<UserProfileEntity> {
  FutureOr<UserProfileEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<UserProfileEntity>, UserProfileEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<UserProfileEntity>, UserProfileEntity>,
              AsyncValue<UserProfileEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
