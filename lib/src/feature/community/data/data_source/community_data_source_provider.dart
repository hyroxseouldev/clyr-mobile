import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/core/supabase/supabase_provider.dart';
import 'package:clyr_mobile/src/feature/community/data/data_source/community_data_source.dart';
import 'package:clyr_mobile/src/feature/community/data/data_source/community_data_source_impl.dart';

part 'community_data_source_provider.g.dart';

/// Provides CommunityDataSource implementation using core Supabase client
@Riverpod(keepAlive: true)
CommunityDataSource communityDataSource(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return CommunityDataSourceImpl(client);
}
