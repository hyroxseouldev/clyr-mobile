import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_crud_service.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_crud_service_impl.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';

part 'supabase_crud_service_provider.g.dart';

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
@Riverpod(keepAlive: true)
SupabaseCrudService supabaseCrudService(Ref ref) {
  final client = ref.read(supabaseClientProvider);
  return SupabaseCrudServiceImpl(client: client);
}
