import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';

/// Widget for community detail header
class CommunityDetailHeader extends StatelessWidget {
  const CommunityDetailHeader({
    super.key,
    required this.community,
    required this.onEdit,
    required this.onDelete,
    required this.editText,
    required this.deleteText,
  });

  final CommunityEntity community;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final String editText;
  final String deleteText;

  bool get isCreator => community.creatorId.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Text(
          community.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        // Event info
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(
                Icons.event_outlined,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatDate(context, community.eventDate),
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      community.location,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Edit/Delete buttons (only for creator)
        if (isCreator && (onEdit != null || onDelete != null)) ...[
          const SizedBox(height: 16),
          Row(
            children: [
              if (onEdit != null)
                FilledButton.tonalIcon(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: Text(editText),
                ),
              if (onDelete != null) ...[
                const SizedBox(width: 8),
                FilledButton.tonalIcon(
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete_outlined, size: 18),
                  label: Text(deleteText),
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.errorContainer,
                    foregroundColor: theme.colorScheme.onErrorContainer,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }

  String _formatDate(BuildContext context, DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
