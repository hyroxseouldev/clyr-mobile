import 'package:clyr_mobile/src/feature/log/infra/entity/log_entity.dart';
import 'package:clyr_mobile/src/feature/log/presentation/widget/log_leaderboard_item_tile.dart';
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
    final itemHeight = renderBox.size.height;

    // Item is visible if any portion is within screen bounds
    final itemTop = position.dy;
    final itemBottom = position.dy + itemHeight;
    final isVisible = itemBottom > 0 && itemTop < screenHeight;

    if (_isMyItemVisible != isVisible) {
      setState(() {
        _isMyItemVisible = isVisible;
      });
    }
  }

  void _scrollToMyItem() {
    if (_itemKey.currentContext == null) return;

    Scrollable.ensureVisible(
      _itemKey.currentContext!,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: 0.5, // Center the item
    );
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

  /// Extracts the "record" value from content map.
  /// Returns '-' if content is null, empty, or record key doesn't exist.
  String _getRecordValue(Map<String, dynamic>? content) {
    if (content == null || content.isEmpty) {
      return '-';
    }

    final recordValue = content['record'];
    if (recordValue == null) {
      return '-';
    }

    final valueStr = recordValue.toString();
    return valueStr.isNotEmpty ? valueStr : '-';
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

              return LogLeaderboardItemTile(
                rank: entry.rank,
                username: entry.userName,
                value: _getRecordValue(entry.content),
                isCurrentUser: isMyItem,
                avatarUrl: entry.userProfileImageUrl,
                itemKey: isMyItem ? _itemKey : null,
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

  Widget _buildFloatingMyItem(LeaderboardEntryEntity entry) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: _scrollToMyItem,
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
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
