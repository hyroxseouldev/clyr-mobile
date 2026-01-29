import 'package:flutter/material.dart';

class LogLeaderboardItemTile extends StatelessWidget {
  final int rank;
  final String username;
  final String value;
  final bool isHover;
  final String? avatarUrl;
  final VoidCallback? onTap;
  final bool isCurrentUser;

  const LogLeaderboardItemTile({
    super.key,
    required this.rank,
    required this.username,
    required this.value,
    this.isHover = false,
    this.avatarUrl,
    this.onTap,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    final isTop3 = rank <= 3;
    final rankColor = _getRankColor(context, rank);
    final theme = Theme.of(context);

    // Background color with animation support
    final backgroundColor = isCurrentUser
        ? theme.colorScheme.secondaryContainer.withValues(alpha: 0.5)
        : isHover
            ? theme.colorScheme.surfaceContainerHighest
            : isTop3
                ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
                : null;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isHover
              ? theme.colorScheme.primary
              : isCurrentUser
                  ? theme.colorScheme.secondary.withValues(alpha: 0.5)
                  : Colors.transparent,
          width: isCurrentUser ? 2 : 1,
        ),
        boxShadow: isHover
            ? [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            // Rank Badge (width: 40)
            _buildRankBadge(context, rank, rankColor),
            const SizedBox(width: 8),

            // Avatar (optional)
            if (avatarUrl != null) ...[
              _buildAvatar(context, avatarUrl!),
              const SizedBox(width: 12),
            ],

            // Username (flex: 3)
            Expanded(
              flex: 3,
              child: Text(
                username,
                style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: (isTop3 || isCurrentUser)
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Value (flex: 1)
            Expanded(
              flex: 1,
              child: Text(
                value,
                style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.right,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankBadge(BuildContext context, int rank, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$rank',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: rank >= 10 ? 12 : 16,
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, String avatarUrl) {
    return ClipOval(
      child: Image.network(
        avatarUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildAvatarFallback(context);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildAvatarFallback(context);
        },
      ),
    );
  }

  Widget _buildAvatarFallback(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.person,
        size: 24,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }

  Color _getRankColor(BuildContext context, int rank) {
    switch (rank) {
      case 1:
        return Colors.amber; // Gold
      case 2:
        return Colors.grey.shade400; // Silver
      case 3:
        return Colors.brown.shade400; // Bronze
      default:
        return Theme.of(context).colorScheme.primary;
    }
  }
}
