import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:clyr_mobile/src/feature/community/data/data_source/community_data_source_provider.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository_impl.dart';

part 'community_repository_provider.g.dart';

/// Provides CommunityRepository implementation with injected DataSource
@Riverpod(keepAlive: true)
CommunityRepository communityRepository(Ref ref) {
  final dataSource = ref.watch(communityDataSourceProvider);
  return CommunityRepositoryImpl(dataSource);
}
