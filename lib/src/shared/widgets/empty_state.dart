import 'package:flutter/material.dart';

/// Empty state widget for displaying when data is not available
///
/// Example usage:
/// ```dart
/// EmptyState(
///   text: '등록된 프로그램이 없습니다',
///   icon: Icon(Icons.folder_open),
/// )
/// ```
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.text,
    this.icon,
  });

  final String text;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              IconTheme(
                data: theme.iconTheme.copyWith(
                  size: 64,
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                ),
                child: icon!,
              ),
            if (icon != null) const SizedBox(height: 16),
            Text(
              text,
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
