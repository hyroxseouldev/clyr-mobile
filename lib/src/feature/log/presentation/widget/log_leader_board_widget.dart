import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Log LeaderBoard Widget
class LogLeaderBoardWidget extends StatelessWidget {
  final List<LeaderboardEntryEntity> entries;

  const LogLeaderBoardWidget({
    super.key,
    required this.entries,
  });

  Color _getRankColor(int rank) {
    return switch (rank) {
      1 => Colors.amber, // Gold
      2 => Colors.grey.shade400, // Silver
      3 => Colors.brown.shade400, // Bronze
      _ => Colors.grey,
    };
  }

  IconData _getRankIcon(int rank) {
    return switch (rank) {
      1 => Icons.emoji_events,
      2 => Icons.military_tech,
      3 => Icons.workspace_premium,
      _ => Icons.person,
    };
  }

  String _formatContent(Map<String, dynamic>? content) {
    if (content == null || content.isEmpty) {
      return '-';
    }
    // Display content as key-value pairs, e.g., "weight: 80kg, reps: 10"
    final entries = content.entries.take(3).map((e) {
      final value = e.value;
      if (value is num) {
        return '${e.key}: ${value.toString()}';
      }
      return '${e.key}: ${value.toString()}';
    }).join(', ');
    return entries;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (entries.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.leaderboard_outlined,
                size: 64,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.noLeaderboardEntries,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final isTop3 = entry.rank <= 3;

        return Card(
          elevation: isTop3 ? 2 : 0,
          color: isTop3
              ? Theme.of(context).colorScheme.primaryContainer
              : null,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            leading: _buildRankBadge(entry.rank),
            leadingAndTrailingTextStyle:
                Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
            title: Row(
              children: [
                if (entry.userProfileImageUrl != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: CachedNetworkImageProvider(
                        entry.userProfileImageUrl!,
                      ),
                      onBackgroundImageError: (_, __) {},
                      child: entry.userProfileImageUrl == null
                          ? Text(
                              entry.userName.isNotEmpty
                                  ? entry.userName[0].toUpperCase()
                                  : '?',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : null,
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        entry.userName.isNotEmpty
                            ? entry.userName[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  child: Text(
                    entry.userName,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight:
                              isTop3 ? FontWeight.bold : FontWeight.normal,
                        ),
                  ),
                ),
              ],
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.fitness_center,
                  size: 14,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    _formatContent(entry.content),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: isTop3
                ? Icon(
                    _getRankIcon(entry.rank),
                    color: _getRankColor(entry.rank),
                    size: 28,
                  )
                : Text(
                    '#${entry.rank}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant,
                        ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildRankBadge(int rank) {
    if (rank <= 3) {
      return Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: _getRankColor(rank),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$rank',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    }
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$rank',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
