import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Log LeaderBoard Widget with floating current user behavior
class LogLeaderBoardWidget extends StatefulWidget {
  final List<LeaderboardEntryEntity> entries;
  final String? currentUserId;
  final String? mySectionRecordId;
  final String emptyStateText;

  const LogLeaderBoardWidget({
    super.key,
    required this.entries,
    this.currentUserId,
    this.mySectionRecordId,
    this.emptyStateText = '리더보드 기록이 없습니다',
  });

  @override
  State<LogLeaderBoardWidget> createState() => _LogLeaderBoardWidgetState();
}

class _LogLeaderBoardWidgetState extends State<LogLeaderBoardWidget> {
  final _scrollController = ScrollController();
  final _itemKey = GlobalKey();
  bool _isMyItemVisible = false;
  int? _myItemIndex;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Find current user's index
    _myItemIndex = widget.entries.indexWhere(
      (e) => e.userId == widget.currentUserId,
    );
  }

  void _onScroll() {
    if (!mounted || _itemKey.currentContext == null) return;

    final RenderBox? renderBox =
        _itemKey.currentContext!.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final position = renderBox.localToGlobal(Offset.zero);
    final screenHeight = MediaQuery.of(context).size.height;
    final isVisible = position.dy >= 0 && position.dy < screenHeight;

    if (_isMyItemVisible != isVisible) {
      setState(() {
        _isMyItemVisible = isVisible;
      });
    }
  }

  @override
  void didUpdateWidget(LogLeaderBoardWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update my item index if entries changed
    if (oldWidget.entries != widget.entries) {
      _myItemIndex = widget.entries.indexWhere(
        (e) => e.userId == widget.currentUserId,
      );
    }
  }

  Color _getRankColor(int rank) {
    return switch (rank) {
      1 => Colors.amber, // Gold
      2 => Colors.grey.shade400, // Silver
      3 => Colors.brown.shade400, // Bronze
      _ => Colors.grey,
    };
  }

  String _formatContent(Map<String, dynamic>? content) {
    if (content == null || content.isEmpty) {
      return '{ }';
    }
    // Display as { key: value, key: value }
    final entries = content.entries
        .take(3)
        .map((e) => '${e.key}: ${e.value}')
        .join(', ');
    return '{ $entries }';
  }

  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
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
                widget.emptyStateText,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final myEntry =
        _myItemIndex != null &&
            _myItemIndex! >= 0 &&
            _myItemIndex! < widget.entries.length
        ? widget.entries[_myItemIndex!]
        : null;

    return Stack(
      children: [
        NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            return false;
          },
          child: ListView.separated(
            controller: _scrollController,
            padding: const EdgeInsets.all(16),
            itemCount: widget.entries.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final entry = widget.entries[index];
              final isMyItem = entry.userId == widget.currentUserId;

              return _buildListItem(
                entry,
                isMyItem,
                isMyItem ? _itemKey : null,
              );
            },
          ),
        ),
        // Floating widget at bottom
        if (!_isMyItemVisible && myEntry != null)
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: _buildFloatingMyItem(myEntry),
          ),
      ],
    );
  }

  Widget _buildListItem(LeaderboardEntryEntity entry, bool isMyItem, Key? key) {
    final isTop3 = entry.rank <= 3;

    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: isMyItem
          ? BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Card(
        elevation: isTop3 ? 2 : 0,
        color: isTop3 ? Theme.of(context).colorScheme.primaryContainer : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              // Rank badge
              _buildRankBadge(entry.rank),
              const SizedBox(width: 8),
              // Dot separator
              Text(
                '·',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 8),
              // User name (80%)
              Expanded(
                flex: 4,
                child: Text(
                  entry.userName,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isTop3 ? FontWeight.bold : FontWeight.normal,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(flex: 1),
              // Record label + value (20%)
              Flexible(
                flex: 1,
                child: Text(
                  '기록 ${_formatContent(entry.content)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
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

  Widget _buildFloatingMyItem(LeaderboardEntryEntity entry) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // User avatar and info
            if (entry.userProfileImageUrl != null)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: CachedNetworkImageProvider(
                    entry.userProfileImageUrl!,
                  ),
                  onBackgroundImageError: (_, __) {},
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white24,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'MY RANK: #${entry.rank}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    entry.userName,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_downward, color: Colors.white),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
