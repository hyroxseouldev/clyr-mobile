import 'package:clyr_mobile/src/core/error/exception.dart';
import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Generic CRUD service interface for Supabase operations
///
/// Provides common Create, Read, Update, Delete operations
/// for any Supabase table with type safety.
abstract class SupabaseCrudService {
  /// Create a new record in the specified table
  ///
  /// [table] - The table name to insert into
  /// [data] - The data to insert as a Map
  /// Returns the created record as Map
  FutureEither<AppException, Map<String, dynamic>> create({
    required String table,
    required Map<String, dynamic> data,
  });

  /// Get a single record by ID
  ///
  /// [table] - The table name to query
  /// [id] - The primary key value (default column: 'id')
  /// [column] - The column name to filter on (default: 'id')
  FutureEither<AppException, Map<String, dynamic>?> getById({
    required String table,
    required String id,
    String column = 'id',
  });

  /// Get multiple records with optional filters
  ///
  /// [table] - The table name to query
  /// [filters] - Optional list of filters (column, value, operator)
  /// [orderBy] - Optional column to order by
  /// [ascending] - Sort order (default: true)
  /// [limit] - Optional maximum number of records
  /// [offset] - Optional offset for pagination
  FutureEither<AppException, List<Map<String, dynamic>>> getMany({
    required String table,
    List<SupabaseFilter>? filters,
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  });

  /// Update a record by ID
  ///
  /// [table] - The table name to update
  /// [id] - The primary key value
  /// [data] - The data to update
  /// [column] - The column name to filter on (default: 'id')
  FutureEither<AppException, Map<String, dynamic>> updateById({
    required String table,
    required String id,
    required Map<String, dynamic> data,
    String column = 'id',
  });

  /// Update records matching filters
  ///
  /// [table] - The table name to update
  /// [data] - The data to update
  /// [filters] - List of filters to match records
  FutureEither<AppException, List<Map<String, dynamic>>> updateMany({
    required String table,
    required Map<String, dynamic> data,
    required List<SupabaseFilter> filters,
  });

  /// Delete a record by ID
  ///
  /// [table] - The table name to delete from
  /// [id] - The primary key value
  /// [column] - The column name to filter on (default: 'id')
  FutureEither<AppException, void> deleteById({
    required String table,
    required String id,
    String column = 'id',
  });

  /// Delete records matching filters
  ///
  /// [table] - The table name to delete from
  /// [filters] - List of filters to match records
  FutureEither<AppException, void> deleteMany({
    required String table,
    required List<SupabaseFilter> filters,
  });

  /// Count records matching filters
  ///
  /// [table] - The table name to count from
  /// [filters] - Optional list of filters
  /// [column] - Column to count (default: '*')
  FutureEither<AppException, int> count({
    required String table,
    List<SupabaseFilter>? filters,
    String column = '*',
  });

  /// Check if a record exists
  ///
  /// [table] - The table name to check
  /// [filters] - Filters to match the record
  FutureEither<AppException, bool> exists({
    required String table,
    required List<SupabaseFilter> filters,
  });

  /// Execute a custom select query with joins
  ///
  /// [table] - The table name to query
  /// [select] - The select query with possible joins
  /// [filters] - Optional list of filters
  /// [orderBy] - Optional column to order by
  /// [ascending] - Sort order (default: true)
  /// [limit] - Optional maximum number of records
  FutureEither<AppException, List<Map<String, dynamic>>> customSelect({
    required String table,
    required String select,
    List<SupabaseFilter>? filters,
    String? orderBy,
    bool ascending = true,
    int? limit,
  });
}

/// Filter specification for Supabase queries
class SupabaseFilter {
  final String column;
  final dynamic value;
  final SupabaseFilterOperator operator;

  const SupabaseFilter({
    required this.column,
    required this.value,
    this.operator = SupabaseFilterOperator.eq,
  });

  /// Factory for equality filter
  factory SupabaseFilter.eq(String column, dynamic value) {
    return SupabaseFilter(column: column, value: value);
  }

  /// Factory for not-equal filter
  factory SupabaseFilter.neq(String column, dynamic value) {
    return SupabaseFilter(
      column: column,
      value: value,
      operator: SupabaseFilterOperator.neq,
    );
  }

  /// Factory for greater-than filter
  factory SupabaseFilter.gt(String column, dynamic value) {
    return SupabaseFilter(
      column: column,
      value: value,
      operator: SupabaseFilterOperator.gt,
    );
  }

  /// Factory for less-than filter
  factory SupabaseFilter.lt(String column, dynamic value) {
    return SupabaseFilter(
      column: column,
      value: value,
      operator: SupabaseFilterOperator.lt,
    );
  }

  /// Factory for greater-than-or-equal filter
  factory SupabaseFilter.gte(String column, dynamic value) {
    return SupabaseFilter(
      column: column,
      value: value,
      operator: SupabaseFilterOperator.gte,
    );
  }

  /// Factory for less-than-or-equal filter
  factory SupabaseFilter.lte(String column, dynamic value) {
    return SupabaseFilter(
      column: column,
      value: value,
      operator: SupabaseFilterOperator.lte,
    );
  }

  /// Factory for LIKE filter
  factory SupabaseFilter.like(String column, String pattern) {
    return SupabaseFilter(
      column: column,
      value: pattern,
      operator: SupabaseFilterOperator.like,
    );
  }

  /// Factory for IN filter
  factory SupabaseFilter.inList(String column, List<dynamic> values) {
    return SupabaseFilter(
      column: column,
      value: values,
      operator: SupabaseFilterOperator.inList,
    );
  }

  /// Factory for IS NULL filter
  factory SupabaseFilter.isNull(String column) {
    return SupabaseFilter(
      column: column,
      value: null,
      operator: SupabaseFilterOperator.isNull,
    );
  }

  /// Apply this filter to a PostgrestBuilder
  PostgrestBuilder apply(PostgrestBuilder query) {
    switch (operator) {
      case SupabaseFilterOperator.eq:
        return query.eq(column, value);
      case SupabaseFilterOperator.neq:
        return query.neq(column, value);
      case SupabaseFilterOperator.gt:
        return query.gt(column, value);
      case SupabaseFilterOperator.lt:
        return query.lt(column, value);
      case SupabaseFilterOperator.gte:
        return query.gte(column, value);
      case SupabaseFilterOperator.lte:
        return query.lte(column, value);
      case SupabaseFilterOperator.like:
        return query.like(column, value);
      case SupabaseFilterOperator.inList:
        return query.in_(column, value);
      case SupabaseFilterOperator.isNull:
        return query.is_(column, null);
    }
  }
}

/// Filter operators for Supabase queries
enum SupabaseFilterOperator {
  /// Equal (=)
  eq,

  /// Not equal (!=)
  neq,

  /// Greater than (>)
  gt,

  /// Less than (<)
  lt,

  /// Greater than or equal (>=)
  gte,

  /// Less than or equal (<=)
  lte,

  /// LIKE pattern matching
  like,

  /// IN (list of values)
  inList,

  /// IS NULL check
  isNull,
}
