import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';

/// Widget for program detail header
class ProgramDetailHeader extends StatelessWidget {
  const ProgramDetailHeader({super.key, required this.program});

  final ProgramEntity program;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayImage = program.programImage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cover Image
        if (displayImage != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              displayImage!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(height: 16),
        // Title
        Text(
          program.title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        // Meta info
        Row(
          children: [
            _buildInfoChip(
              context,
              Icons.calendar_today,
              '${program.durationWeeks}주',
            ),
            const SizedBox(width: 8),
            _buildInfoChip(
              context,
              Icons.event_repeat,
              '주${program.daysPerWeek}일',
            ),
            const SizedBox(width: 8),
            _buildInfoChip(
              context,
              Icons.fitness_center,
              _formatDifficulty(program.difficulty),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDifficulty(String difficulty) {
    return switch (difficulty) {
      'BEGINNER' => '입문',
      'INTERMEDIATE' => '중급',
      'ADVANCED' => '고급',
      _ => difficulty,
    };
  }
}
