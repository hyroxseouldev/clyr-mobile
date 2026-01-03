// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SessionNotifier)
final sessionProvider = SessionNotifierProvider._();

final class SessionNotifierProvider
    extends $NotifierProvider<SessionNotifier, AsyncValue<User?>> {
  SessionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionNotifierHash();

  @$internal
  @override
  SessionNotifier create() => SessionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<User?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<User?>>(value),
    );
  }
}

String _$sessionNotifierHash() => r'879812d3c3f5ab209f387106b7ab638ceabb099c';

abstract class _$SessionNotifier extends $Notifier<AsyncValue<User?>> {
  AsyncValue<User?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<User?>, AsyncValue<User?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<User?>, AsyncValue<User?>>,
              AsyncValue<User?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
