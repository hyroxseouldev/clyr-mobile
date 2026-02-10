// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Program list state

@ProviderFor(ProgramList)
final programListProvider = ProgramListProvider._();

/// Program list state
final class ProgramListProvider
    extends $AsyncNotifierProvider<ProgramList, List<ProgramEntity>> {
  /// Program list state
  ProgramListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'programListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$programListHash();

  @$internal
  @override
  ProgramList create() => ProgramList();
}

String _$programListHash() => r'efb6203484de39faf716d548fff7d5e612850547';

/// Program list state

abstract class _$ProgramList extends $AsyncNotifier<List<ProgramEntity>> {
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
