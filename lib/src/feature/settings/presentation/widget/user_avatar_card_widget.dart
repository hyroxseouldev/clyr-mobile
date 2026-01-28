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
    this.avatarRadius = 40,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
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
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  )
                : null,
          ),
          const SizedBox(height: 16),

          // User Name
          Text(
            userName,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),

          // Edit Button (if onEditPressed is provided)
          if (onEditPressed != null) ...[
            const SizedBox(height: 16),
            FilledButton.tonalIcon(
              onPressed: onEditPressed,
              icon: const Icon(Icons.edit_outlined, size: 18),
              label: Text(editButtonText ?? l10n.modify),
            ),
          ],
        ],
      ),
    );
  }
}
