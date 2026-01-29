import 'package:flutter/material.dart';

class LogLeaderboardItemTile extends StatelessWidget {
  final int rank;
  final String username;
  final String value;
  final String? avatarUrl;
  final VoidCallback? onTap;
  final bool isCurrentUser;
  final Key? itemKey;

  const LogLeaderboardItemTile({
    super.key,
    required this.rank,
    required this.username,
    required this.value,
    this.avatarUrl,
    this.onTap,
    this.isCurrentUser = false,
    this.itemKey,
  });

  @override
  Widget build(BuildContext context) {
    final isTop3 = rank <= 3;
    final rankColor = _getRankColor(context, rank);
    final theme = Theme.of(context);

    // Background color
    final backgroundColor = isCurrentUser
        ? theme.colorScheme.secondaryContainer.withValues(alpha: 0.5)
        : isTop3
            ? theme.colorScheme.primaryContainer.withValues(alpha: 0.3)
            : null;

    return Container(
      key: itemKey, // Pass itemKey to Container for RenderBox access
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isCurrentUser
              ? theme.colorScheme.secondary.withValues(alpha: 0.5)
              : Colors.transparent,
          width: 2,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Row(
          children: [
            // Rank Badge (width: 40)
            _buildRankBadge(context, rank, rankColor),
            const SizedBox(width: 8),

            // Avatar (always shown)
            _buildAvatar(context, avatarUrl, username),
            const SizedBox(width: 12),

            // Username (flex: 4)
            Expanded(
              flex: 4,
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

            // Value (flex: 2)
            Expanded(
              flex: 2,
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

  Widget _buildAvatar(BuildContext context, String? avatarUrl, String username) {
    if (avatarUrl == null || avatarUrl.isEmpty) {
      return _buildAvatarFallback(context, username);
    }

    return ClipOval(
      child: Image.network(
        avatarUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return _buildAvatarFallback(context, username);
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildAvatarFallback(context, username);
        },
      ),
    );
  }

  Widget _buildAvatarFallback(BuildContext context, String username) {
    final theme = Theme.of(context);
    final firstLetter = username.isNotEmpty ? username[0].toUpperCase() : '?';

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          firstLetter,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
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
