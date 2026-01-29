import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FloatingBottomItem extends StatelessWidget {
  final int rank;
  final String username;
  final String value;
  final String? avatarUrl;
  final bool isVisible;
  final VoidCallback onTap;
  final String? rankLabel;
  final Widget? leadingIcon;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Duration animationDuration;
  final Curve animationCurve;

  const FloatingBottomItem({
    super.key,
    required this.rank,
    required this.username,
    required this.value,
    required this.isVisible,
    required this.onTap,
    this.avatarUrl,
    this.rankLabel,
    this.leadingIcon,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeInOut,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: animationDuration,
      curve: animationCurve,
      child: AnimatedSlide(
        offset: isVisible ? Offset.zero : const Offset(0, 1),
        duration: animationDuration,
        curve: animationCurve,
        child: Material(
          elevation: elevation ?? 8,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primaryContainer,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(12),
              ),
              padding: padding ?? const EdgeInsets.all(12),
              child: Row(
                children: [
                  _buildAvatar(context),
                  const SizedBox(width: 12),
                  Expanded(child: _buildUserInfo(context)),
                  _buildTrailingIcon(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: CachedNetworkImageProvider(avatarUrl!),
        onBackgroundImageError: (_, __) {},
        backgroundColor: Colors.white24,
        child: _buildAvatarFallback(context),
      );
    }
    return _buildAvatarFallback(context);
  }

  Widget _buildAvatarFallback(BuildContext context) {
    final firstChar = username.isNotEmpty ? username[0].toUpperCase() : '?';

    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.white24,
      child: Text(
        firstChar,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rankLabel != null ? '$rankLabel #$rank' : '#$rank',
          style: theme.textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 2),
        Text(
          username,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.white70,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (value.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white60,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  Widget _buildTrailingIcon(BuildContext context) {
    return leadingIcon ??
        const Icon(
          Icons.arrow_downward,
          color: Colors.white,
        );
  }
}
