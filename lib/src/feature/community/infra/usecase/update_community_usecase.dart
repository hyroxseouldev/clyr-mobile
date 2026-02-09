import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for UpdateCommunityUseCase
class UpdateCommunityParams {
  const UpdateCommunityParams({
    required this.id,
    this.title,
    this.content,
    this.imageUrl,
    this.eventDate,
    this.location,
    this.maxParticipants,
  });

  final String id;
  final String? title;
  final String? content;
  final String? imageUrl;
  final DateTime? eventDate;
  final String? location;
  final int? maxParticipants;
}

/// Use case for updating an existing community
class UpdateCommunityUseCase {
  const UpdateCommunityUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<CommunityEntity> call(UpdateCommunityParams params) async {
    return _communityRepository.updateCommunity(
      id: params.id,
      title: params.title,
      content: params.content,
      imageUrl: params.imageUrl,
      eventDate: params.eventDate,
      location: params.location,
      maxParticipants: params.maxParticipants,
    );
  }
}
