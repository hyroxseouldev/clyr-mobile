import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/feature/program/data/data_source/program_data_source.dart';
import 'package:clyr_mobile/src/feature/program/data/data_source/program_data_source_impl.dart';

part 'program_data_source_provider.g.dart';

/// Provides ProgramDataSource implementation using core Supabase client
@Riverpod(keepAlive: true)
ProgramDataSource programDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return ProgramDataSourceImpl(client);
}
