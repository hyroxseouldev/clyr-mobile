import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';

/// Widget for displaying creator profile chip
class CommunityCreatorChip extends StatelessWidget {
  const CommunityCreatorChip({
    super.key,
    required this.creator,
    required this.createdByText,
  });

  final CreatorProfileEntity creator;
  final String createdByText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasValidAvatarUrl = creator.avatarUrl != null && creator.avatarUrl!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          CircleAvatar(
            radius: 12,
            child: hasValidAvatarUrl
                ? ClipOval(
                    child: Image.network(
                      creator.avatarUrl!,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Text(
                          creator.fullName.isNotEmpty
                              ? creator.fullName[0].toUpperCase()
                              : '?',
                          style: theme.textTheme.labelSmall,
                        );
                      },
                    ),
                  )
                : Text(
                    creator.fullName.isNotEmpty
                        ? creator.fullName[0].toUpperCase()
                        : '?',
                    style: theme.textTheme.labelSmall,
                  ),
          ),
          const SizedBox(width: 8),
          // Name
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                createdByText,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                creator.fullName,
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
