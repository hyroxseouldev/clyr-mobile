import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/user_profile_controller.dart';
import 'package:clyr_mobile/src/feature/settings/presentation/view/settings_home_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileIconButton extends ConsumerWidget {
  const ProfileIconButton({
    super.key,
    this.size = 36,
    this.iconSize = 18,
    this.onPressed,
  });

  final double size;
  final double iconSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(userProfileControllerProvider);
    final avatarUrl = profileState.maybeWhen(
      data: (profile) => profile.profileImageUrl,
      orElse: () => null,
    );
    final hasAvatar = avatarUrl != null && avatarUrl.isNotEmpty;
    final theme = Theme.of(context);

    return IconButton(
      onPressed:
          onPressed ?? () => context.pushNamed(SettingsHomeView.routeName),
      icon: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.surfaceContainerHighest,
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: ClipOval(
          child: hasAvatar
              ? Image.network(
                  avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      _AvatarPlaceholder(iconSize: iconSize),
                )
              : _AvatarPlaceholder(iconSize: iconSize),
        ),
      ),
    );
  }
}

class _AvatarPlaceholder extends StatelessWidget {
  const _AvatarPlaceholder({required this.iconSize});

  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Icon(
        Icons.person_outline,
        size: iconSize,
        color: theme.colorScheme.onSurfaceVariant,
      ),
    );
  }
}
