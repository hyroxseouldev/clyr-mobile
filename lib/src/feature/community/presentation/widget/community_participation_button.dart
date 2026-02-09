import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_participation_controller.dart';

/// Widget for join/leave community button
class CommunityParticipationButton extends StatelessWidget {
  const CommunityParticipationButton({
    super.key,
    required this.status,
    required this.isFull,
    required this.isCreator,
    required this.onJoin,
    required this.onLeave,
    required this.joinText,
    required this.leaveText,
    required this.fullText,
    required this.creatorOnlyText,
  });

  final ParticipationStatus status;
  final bool isFull;
  final bool isCreator;
  final VoidCallback onJoin;
  final VoidCallback onLeave;
  final String joinText;
  final String leaveText;
  final String fullText;
  final String creatorOnlyText;

  bool get isLoading => status == ParticipationStatus.loading;
  bool get isJoined => status == ParticipationStatus.joined;
  bool get showError => status == ParticipationStatus.error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // If user is creator, show special message
    if (isCreator) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          creatorOnlyText,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    // If community is full
    if (isFull) {
      return FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(
          backgroundColor: theme.colorScheme.errorContainer,
          foregroundColor: theme.colorScheme.onErrorContainer,
          minimumSize: const Size.fromHeight(48),
        ),
        child: Text(fullText),
      );
    }

    // Loading state
    if (isLoading) {
      return FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
        ),
        child: const SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    // Joined state - show leave button
    if (isJoined) {
      return FilledButton.tonal(
        onPressed: onLeave,
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(48),
        ),
        child: Text(leaveText),
      );
    }

    // Not joined state - show join button
    return FilledButton(
      onPressed: onJoin,
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
      ),
      child: Text(joinText),
    );
  }
}
