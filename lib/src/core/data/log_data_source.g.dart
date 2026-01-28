// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Log Data Source Provider

@ProviderFor(logDataSource)
final logDataSourceProvider = LogDataSourceProvider._();

/// Log Data Source Provider

final class LogDataSourceProvider
    extends $FunctionalProvider<LogDataSource, LogDataSource, LogDataSource>
    with $Provider<LogDataSource> {
  /// Log Data Source Provider
  LogDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'logDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$logDataSourceHash();

  @$internal
  @override
  $ProviderElement<LogDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LogDataSource create(Ref ref) {
    return logDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LogDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LogDataSource>(value),
    );
  }
}

String _$logDataSourceHash() => r'5460a7cf570202185157c7e9349c2cc274f7ffc2';
