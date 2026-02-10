// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Program detail state

@ProviderFor(ProgramDetail)
final programDetailProvider = ProgramDetailFamily._();

/// Program detail state
final class ProgramDetailProvider
    extends $AsyncNotifierProvider<ProgramDetail, ProgramEntity?> {
  /// Program detail state
  ProgramDetailProvider._({
    required ProgramDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'programDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$programDetailHash();

  @override
  String toString() {
    return r'programDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProgramDetail create() => ProgramDetail();

  @override
  bool operator ==(Object other) {
    return other is ProgramDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$programDetailHash() => r'8b7e9c3994255aa4c892648b9bd7de567fc45388';

/// Program detail state

final class ProgramDetailFamily extends $Family
    with
        $ClassFamilyOverride<
          ProgramDetail,
          AsyncValue<ProgramEntity?>,
          ProgramEntity?,
          FutureOr<ProgramEntity?>,
          String
        > {
  ProgramDetailFamily._()
    : super(
        retry: null,
        name: r'programDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Program detail state

  ProgramDetailProvider call(String programId) =>
      ProgramDetailProvider._(argument: programId, from: this);

  @override
  String toString() => r'programDetailProvider';
}

/// Program detail state

abstract class _$ProgramDetail extends $AsyncNotifier<ProgramEntity?> {
  late final _$args = ref.$arg as String;
  String get programId => _$args;

  FutureOr<ProgramEntity?> build(String programId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProgramEntity?>, ProgramEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProgramEntity?>, ProgramEntity?>,
              AsyncValue<ProgramEntity?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
