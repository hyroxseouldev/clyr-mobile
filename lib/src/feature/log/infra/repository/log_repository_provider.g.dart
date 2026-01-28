// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Log 리포지토리 프로바이더

@ProviderFor(logRepository)
final logRepositoryProvider = LogRepositoryProvider._();

/// Log 리포지토리 프로바이더

final class LogRepositoryProvider
    extends $FunctionalProvider<LogRepository, LogRepository, LogRepository>
    with $Provider<LogRepository> {
  /// Log 리포지토리 프로바이더
  LogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logRepositoryHash();

  @$internal
  @override
  $ProviderElement<LogRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogRepository create(Ref ref) {
    return logRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogRepository>(value),
    );
  }
}

String _$logRepositoryHash() => r'259efcc6c63732a7c343e24be875e149cfe501dd';
