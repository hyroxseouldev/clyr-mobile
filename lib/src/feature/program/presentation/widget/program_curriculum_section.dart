import 'package:flutter/material.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';

/// Widget for program curriculum section
class ProgramCurriculumSection extends StatelessWidget {
  const ProgramCurriculumSection({super.key, required this.curriculum});

  final List<CurriculumItemEntity> curriculum;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '커리큘럼',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        ...curriculum.asMap().entries.map((entry) {
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ExpansionTile(
              leading: CircleAvatar(child: Text('${entry.key + 1}')),
              title: Text(entry.value.title),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(entry.value.description),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}
