import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

/// 사용자 프로필 정보를 표시하는 카드 위젯
class UserAvatarCard extends StatelessWidget {
  final String userAvatarUrl;
  final String userName;
  final VoidCallback? onEditPressed;
  final String? editButtonText;
  final double avatarRadius;
  final EdgeInsets? padding;

  const UserAvatarCard({
    required this.userAvatarUrl,
    required this.userName,
    this.onEditPressed,
    this.editButtonText,
    this.avatarRadius = 32,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: padding ?? const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar
              CircleAvatar(
                radius: avatarRadius,
                backgroundImage: userAvatarUrl.isNotEmpty
                    ? NetworkImage(userAvatarUrl)
                    : null,
                onBackgroundImageError: userAvatarUrl.isNotEmpty
                    ? (exception, stackTrace) {}
                    : null,
                child: userAvatarUrl.isEmpty
                    ? Icon(
                        Icons.person,
                        size: avatarRadius,
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.4,
                        ),
                      )
                    : null,
              ),
              const SizedBox(width: 16),

              Text(
                userName,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              if (onEditPressed != null) ...[
                OutlinedButton.icon(
                  onPressed: onEditPressed,
                  icon: const Icon(Icons.edit_outlined, size: 12),
                  label: Text(
                    editButtonText ?? l10n.modify,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
