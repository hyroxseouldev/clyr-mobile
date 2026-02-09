import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';

/// Widget for community detail info section
class CommunityDetailInfo extends StatelessWidget {
  const CommunityDetailInfo({
    super.key,
    required this.community,
    required this.participantsText,
    required this.availableText,
    required this.fullText,
  });

  final CommunityEntity community;
  final String participantsText;
  final String availableText;
  final String fullText;

  bool get isFull => community.currentParticipants >= community.maxParticipants;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Participants row
          Row(
            children: [
              Icon(
                Icons.people_outline,
                color: isFull
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participantsText,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    '${community.currentParticipants}/${community.maxParticipants}',
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isFull
                          ? theme.colorScheme.error
                          : theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isFull
                      ? theme.colorScheme.errorContainer
                      : theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isFull ? fullText : availableText,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: isFull
                        ? theme.colorScheme.onErrorContainer
                        : theme.colorScheme.onPrimaryContainer,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: community.currentParticipants / community.maxParticipants,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              valueColor: AlwaysStoppedAnimation<Color>(
                isFull ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}
