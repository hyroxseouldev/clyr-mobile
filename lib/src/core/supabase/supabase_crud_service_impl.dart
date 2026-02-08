import 'package:flutter/foundation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_crud_service.dart';

/// Implementation of SupabaseCrudService
///
/// Provides generic CRUD operations for Supabase tables
/// with comprehensive error handling and debug logging.
class SupabaseCrudServiceImpl implements SupabaseCrudService {
  final SupabaseClient _client;

  SupabaseCrudServiceImpl({required SupabaseClient client}) : _client = client;

  @override
  FutureEither<AppException, Map<String, dynamic>> create({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    debugPrint('🔹 [SupabaseCrudService] Creating record in "$table"');

    try {
      final response = await _client.from(table).insert(data).select().single();

      debugPrint('✅ [SupabaseCrudService] Record created: ${response['id']}');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Create error: $e');
      return left(AppException.database('Failed to create record: $e'));
    }
  }

  @override
  FutureEither<AppException, Map<String, dynamic>?> getById({
    required String table,
    required String id,
    String column = 'id',
  }) async {
    debugPrint('🔍 [SupabaseCrudService] Fetching from "$table" by $column=$id');

    try {
      final response = await _client.from(table).select().eq(column, id).maybeSingle();

      if (response == null) {
        debugPrint('📭 [SupabaseCrudService] No record found');
        return right(null);
      }

      debugPrint('✅ [SupabaseCrudService] Record fetched');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Fetch error: $e');
      return left(AppException.database('Failed to fetch record: $e'));
    }
  }

  @override
  FutureEither<AppException, List<Map<String, dynamic>>> getMany({
    required String table,
    List<SupabaseFilter>? filters,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  }) async {
    debugPrint('🔍 [SupabaseCrudService] Fetching from "$table"');

    try {
      var query = _client.from(table).select();

      // Apply filters
      if (filters != null && filters.isNotEmpty) {
        for (final filter in filters) {
          query = filter.apply(query);
        }
        debugPrint('   Filters: ${filters.map((f) => '${f.column} ${f.operator.name}').join(', ')}');
      }

      // Apply ordering
      if (orderBy != null) {
        query = query.order(orderBy, ascending: ascending);
        debugPrint('   Order by: $orderBy (${ascending ? 'ASC' : 'DESC'})');
      }

      // Apply pagination
      if (offset != null) {
        query = query.range(offset, offset + (limit ?? 100) - 1);
      } else if (limit != null) {
        query = query.limit(limit);
      }

      final response = await query;

      debugPrint('✅ [SupabaseCrudService] Fetched ${response.length} records');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Fetch error: $e');
      return left(AppException.database('Failed to fetch records: $e'));
    }
  }

  @override
  FutureEither<AppException, Map<String, dynamic>> updateById({
    required String table,
    required String id,
    required Map<String, dynamic> data,
    String column = 'id',
  }) async {
    debugPrint('🔧 [SupabaseCrudService] Updating record in "$table": $column=$id');

    try {
      final response = await _client.from(table).update(data).eq(column, id).select().single();

      debugPrint('✅ [SupabaseCrudService] Record updated');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Update error: $e');
      return left(AppException.database('Failed to update record: $e'));
    }
  }

  @override
  FutureEither<AppException, List<Map<String, dynamic>>> updateMany({
    required String table,
    required Map<String, dynamic> data,
    required List<SupabaseFilter> filters,
  }) async {
    debugPrint('🔧 [SupabaseCrudService] Updating records in "$table"');

    try {
      var query = _client.from(table).update(data);

      for (final filter in filters) {
        query = filter.apply(query);
      }

      final response = await query.select();

      debugPrint('✅ [SupabaseCrudService] Updated ${response.length} records');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Update error: $e');
      return left(AppException.database('Failed to update records: $e'));
    }
  }

  @override
  FutureEither<AppException, void> deleteById({
    required String table,
    required String id,
    String column = 'id',
  }) async {
    debugPrint('🗑️ [SupabaseCrudService] Deleting from "$table": $column=$id');

    try {
      await _client.from(table).delete().eq(column, id);

      debugPrint('✅ [SupabaseCrudService] Record deleted');
      return right(null);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Delete error: $e');
      return left(AppException.database('Failed to delete record: $e'));
    }
  }

  @override
  FutureEither<AppException, void> deleteMany({
    required String table,
    required List<SupabaseFilter> filters,
  }) async {
    debugPrint('🗑️ [SupabaseCrudService] Deleting from "$table"');

    try {
      var query = _client.from(table).delete();

      for (final filter in filters) {
        query = filter.apply(query);
      }

      await query;

      debugPrint('✅ [SupabaseCrudService] Records deleted');
      return right(null);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Delete error: $e');
      return left(AppException.database('Failed to delete records: $e'));
    }
  }

  @override
  FutureEither<AppException, int> count({
    required String table,
    List<SupabaseFilter>? filters,
    String column = '*',
  }) async {
    debugPrint('🔢 [SupabaseCrudService] Counting in "$table"');

    try {
      var query = _client.from(table).select(column, count: CountOption.exact);

      if (filters != null && filters.isNotEmpty) {
        for (final filter in filters) {
          query = filter.apply(query);
        }
      }

      final response = await query;
      final count = response.count ?? 0;

      debugPrint('✅ [SupabaseCrudService] Count: $count');
      return right(count);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Count error: $e');
      return left(AppException.database('Failed to count records: $e'));
    }
  }

  @override
  FutureEither<AppException, bool> exists({
    required String table,
    required List<SupabaseFilter> filters,
  }) async {
    debugPrint('🔍 [SupabaseCrudService] Checking existence in "$table"');

    final result = await count(table: table, filters: filters);

    return result.fold(
      (error) => left(error),
      (count) {
        final exists = count > 0;
        debugPrint('✅ [SupabaseCrudService] Exists: $exists');
        return right(exists);
      },
    );
  }

  @override
  FutureEither<AppException, List<Map<String, dynamic>>> customSelect({
    required String table,
    required String select,
    List<SupabaseFilter>? filters,
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    debugPrint('🔍 [SupabaseCrudService] Custom select from "$table"');

    try {
      var query = _client.from(table).select(select);

      if (filters != null && filters.isNotEmpty) {
        for (final filter in filters) {
          query = filter.apply(query);
        }
      }

      if (orderBy != null) {
        query = query.order(orderBy, ascending: ascending);
      }

      if (limit != null) {
        query = query.limit(limit);
      }

      final response = await query;

      debugPrint('✅ [SupabaseCrudService] Fetched ${response.length} records');
      return right(response);
    } catch (e) {
      debugPrint('❌ [SupabaseCrudService] Custom select error: $e');
      return left(AppException.database('Failed to execute query: $e'));
    }
  }
}
