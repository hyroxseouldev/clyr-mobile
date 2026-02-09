import 'package:clyr_mobile/src/core/util/type_defs.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/data/repository/community_repository.dart';

/// Parameters for CreateCommunityUseCase
class CreateCommunityParams {
  const CreateCommunityParams({
    required this.title,
    required this.content,
    this.imageUrl,
    required this.eventDate,
    required this.location,
    this.maxParticipants = 30,
  });

  final String title;
  final String content;
  final String? imageUrl;
  final DateTime eventDate;
  final String location;
  final int maxParticipants;
}

/// Use case for creating a new community
class CreateCommunityUseCase {
  const CreateCommunityUseCase({
    required CommunityRepository communityRepository,
  }) : _communityRepository = communityRepository;

  final CommunityRepository _communityRepository;

  /// Execute the use case
  FutureEither<CommunityEntity> call(CreateCommunityParams params) async {
    return _communityRepository.createCommunity(
      title: params.title,
      content: params.content,
      imageUrl: params.imageUrl,
      eventDate: params.eventDate,
      location: params.location,
      maxParticipants: params.maxParticipants,
    );
  }
}
