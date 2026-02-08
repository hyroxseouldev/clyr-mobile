// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_crud_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for SupabaseCrudService
///
/// Usage example:
/// ```dart
/// final crudService = ref.read(supabaseCrudServiceProvider);
///
/// // Create
/// final result = await crudService.create(
///   table: 'users',
///   data: {'name': 'John', 'email': 'john@example.com'},
/// );
///
/// // Read by ID
/// final user = await crudService.getById(
///   table: 'users',
///   id: 'user-123',
/// );
///
/// // Read many with filters
/// final users = await crudService.getMany(
///   table: 'users',
///   filters: [
///     SupabaseFilter.eq('status', 'active'),
///     SupabaseFilter.gte('age', 18),
///   ],
///   orderBy: 'created_at',
///   ascending: false,
///   limit: 10,
/// );
///
/// // Update
/// await crudService.updateById(
///   table: 'users',
///   id: 'user-123',
///   data: {'name': 'John Doe'},
/// );
///
/// // Delete
/// await crudService.deleteById(
///   table: 'users',
///   id: 'user-123',
/// );
/// ```

@ProviderFor(supabaseCrudService)
final supabaseCrudServiceProvider = SupabaseCrudServiceProvider._();

/// Provider for SupabaseCrudService
///
/// Usage example:
/// ```dart
/// final crudService = ref.read(supabaseCrudServiceProvider);
///
/// // Create
/// final result = await crudService.create(
///   table: 'users',
///   data: {'name': 'John', 'email': 'john@example.com'},
/// );
///
/// // Read by ID
/// final user = await crudService.getById(
///   table: 'users',
///   id: 'user-123',
/// );
///
/// // Read many with filters
/// final users = await crudService.getMany(
///   table: 'users',
///   filters: [
///     SupabaseFilter.eq('status', 'active'),
///     SupabaseFilter.gte('age', 18),
///   ],
///   orderBy: 'created_at',
///   ascending: false,
///   limit: 10,
/// );
///
/// // Update
/// await crudService.updateById(
///   table: 'users',
///   id: 'user-123',
///   data: {'name': 'John Doe'},
/// );
///
/// // Delete
/// await crudService.deleteById(
///   table: 'users',
///   id: 'user-123',
/// );
/// ```

final class SupabaseCrudServiceProvider
    extends
        $FunctionalProvider<
          SupabaseCrudService,
          SupabaseCrudService,
          SupabaseCrudService
        >
    with $Provider<SupabaseCrudService> {
  /// Provider for SupabaseCrudService
  ///
  /// Usage example:
  /// ```dart
  /// final crudService = ref.read(supabaseCrudServiceProvider);
  ///
  /// // Create
  /// final result = await crudService.create(
  ///   table: 'users',
  ///   data: {'name': 'John', 'email': 'john@example.com'},
  /// );
  ///
  /// // Read by ID
  /// final user = await crudService.getById(
  ///   table: 'users',
  ///   id: 'user-123',
  /// );
  ///
  /// // Read many with filters
  /// final users = await crudService.getMany(
  ///   table: 'users',
  ///   filters: [
  ///     SupabaseFilter.eq('status', 'active'),
  ///     SupabaseFilter.gte('age', 18),
  ///   ],
  ///   orderBy: 'created_at',
  ///   ascending: false,
  ///   limit: 10,
  /// );
  ///
  /// // Update
  /// await crudService.updateById(
  ///   table: 'users',
  ///   id: 'user-123',
  ///   data: {'name': 'John Doe'},
  /// );
  ///
  /// // Delete
  /// await crudService.deleteById(
  ///   table: 'users',
  ///   id: 'user-123',
  /// );
  /// ```
  SupabaseCrudServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supabaseCrudServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supabaseCrudServiceHash();

  @$internal
  @override
  $ProviderElement<SupabaseCrudService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SupabaseCrudService create(Ref ref) {
    return supabaseCrudService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupabaseCrudService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupabaseCrudService>(value),
    );
  }
}

String _$supabaseCrudServiceHash() =>
    r'b3a247680e759def4112b6c7dd89fbc982490d1b';
