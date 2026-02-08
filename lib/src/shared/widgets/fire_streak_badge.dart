import 'package:flutter/material.dart';

/// A fire streak badge widget that displays consecutive count with fire icon.
///
/// Features:
/// - Normal mode (< feverThreshold): Static outlined fire icon
/// - Fever mode (>= feverThreshold): Animated filled fire with color change
///
/// Example usage:
/// ```dart
/// FireStreakBadge(count: 2)           // Normal mode
/// FireStreakBadge(count: 7)           // Fever mode (animated)
/// FireStreakBadge(count: 5, feverThreshold: 5)  // Custom threshold
/// ```
class FireStreakBadge extends StatelessWidget {
  const FireStreakBadge({
    required this.count,
    this.feverThreshold = 3,
    super.key,
  });

  /// The current streak count
  final int count;

  /// When count >= this, fever mode activates (default: 3)
  final int feverThreshold;

  bool get isFever => count >= feverThreshold;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 20,
      decoration: BoxDecoration(
        color: isFever
            ? theme.colorScheme.errorContainer.withOpacity(0.3)
            : theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFever
              ? theme.colorScheme.error.withOpacity(0.5)
              : theme.colorScheme.outline.withOpacity(0.3),
        ),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Fire icon with animation in fever mode
            if (isFever)
              const _AnimatedFireIcon()
            else
              const Icon(Icons.local_fire_department_outlined, size: 14),
            const SizedBox(width: 2),
            // Count text
            Text(
              count.toString(),
              style: theme.textTheme.labelMedium?.copyWith(
                color: isFever
                    ? theme.colorScheme.error
                    : theme.colorScheme.onSurface,
                fontWeight: isFever ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Animated fire icon for fever mode.
class _AnimatedFireIcon extends StatefulWidget {
  const _AnimatedFireIcon();

  @override
  State<_AnimatedFireIcon> createState() => _AnimatedFireIconState();
}

class _AnimatedFireIconState extends State<_AnimatedFireIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15, // Reduced from 1.3 to prevent overflow
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 20,
      height: 20,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.center,
            child: Icon(
              Icons.whatshot,
              size: 16,
              color: Color.lerp(
                theme.colorScheme.primary,
                theme.colorScheme.error,
                _scaleAnimation.value,
              ),
            ),
          );
        },
      ),
    );
  }
}
