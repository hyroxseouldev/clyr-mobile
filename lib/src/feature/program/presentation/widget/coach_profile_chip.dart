import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';

/// Widget for displaying coach profile chip
class CoachProfileChip extends StatelessWidget {
  const CoachProfileChip({
    super.key,
    required this.coach,
    required this.coachText,
  });

  final CoachProfileEntity coach;
  final String coachText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasValidAvatarUrl =
        coach.profileImageUrl != null && coach.profileImageUrl!.isNotEmpty;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 12,
            child: hasValidAvatarUrl
                ? ClipOval(
                    child: Image.network(
                      coach.profileImageUrl!,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  )
                : Text(
                    coach.nickname?.isNotEmpty == true
                        ? coach.nickname![0].toUpperCase()
                        : '?',
                  ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                coachText,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                coach.nickname ?? '',
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
