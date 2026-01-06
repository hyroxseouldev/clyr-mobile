// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_log_mutation_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 운동 로그 생성 컨트롤러

@ProviderFor(CreateWorkoutLogController)
final createWorkoutLogControllerProvider =
    CreateWorkoutLogControllerProvider._();

/// 운동 로그 생성 컨트롤러
final class CreateWorkoutLogControllerProvider
    extends $NotifierProvider<CreateWorkoutLogController, AsyncValue<void>> {
  /// 운동 로그 생성 컨트롤러
  CreateWorkoutLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createWorkoutLogControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$createWorkoutLogControllerHash();

  @$internal
  @override
  CreateWorkoutLogController create() => CreateWorkoutLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$createWorkoutLogControllerHash() =>
    r'f606bbe8bd08920e70da3c7b5aecca3da9e1dc1e';

/// 운동 로그 생성 컨트롤러

abstract class _$CreateWorkoutLogController
    extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 운동 로그 수정 컨트롤러

@ProviderFor(UpdateWorkoutLogController)
final updateWorkoutLogControllerProvider =
    UpdateWorkoutLogControllerProvider._();

/// 운동 로그 수정 컨트롤러
final class UpdateWorkoutLogControllerProvider
    extends $NotifierProvider<UpdateWorkoutLogController, AsyncValue<void>> {
  /// 운동 로그 수정 컨트롤러
  UpdateWorkoutLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateWorkoutLogControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateWorkoutLogControllerHash();

  @$internal
  @override
  UpdateWorkoutLogController create() => UpdateWorkoutLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$updateWorkoutLogControllerHash() =>
    r'f4f52876f439f94c82e10d7ce35284132eac11a0';

/// 운동 로그 수정 컨트롤러

abstract class _$UpdateWorkoutLogController
    extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// 운동 로그 삭제 컨트롤러

@ProviderFor(DeleteWorkoutLogController)
final deleteWorkoutLogControllerProvider =
    DeleteWorkoutLogControllerProvider._();

/// 운동 로그 삭제 컨트롤러
final class DeleteWorkoutLogControllerProvider
    extends $NotifierProvider<DeleteWorkoutLogController, AsyncValue<void>> {
  /// 운동 로그 삭제 컨트롤러
  DeleteWorkoutLogControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deleteWorkoutLogControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deleteWorkoutLogControllerHash();

  @$internal
  @override
  DeleteWorkoutLogController create() => DeleteWorkoutLogController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$deleteWorkoutLogControllerHash() =>
    r'89a4c7ec0e0393be745467b0affe4af389fdbd17';

/// 운동 로그 삭제 컨트롤러

abstract class _$DeleteWorkoutLogController
    extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
