import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:flutter/material.dart';

/// 프로그램 선택 위젯
///
/// 프로그램 리스트를 표시하고 사용자가 프로그램을 선택할 수 있는 셀렉터 위젯
class ProgramSelector extends StatelessWidget {
  /// 표시할 프로그램 리스트
  final List<ActiveProgramEntity> programList;

  /// 현재 선택된 프로그램
  final ActiveProgramEntity? selectedProgram;

  /// 프로그램 선택 콜백
  final Function(ActiveProgramEntity) onSelected;

  const ProgramSelector({
    super.key,
    required this.programList,
    required this.selectedProgram,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (programList.isEmpty) {
      return _buildEmptyState(context);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: programList.map((program) {
        final isSelected = selectedProgram?.id == program.id;
        return _ProgramSelectorItem(
          program: program,
          isSelected: isSelected,
          onTap: () => onSelected(program),
        );
      }).toList(),
    );
  }

  /// 빈 상태 위젯
  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.fitness_center_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.noProgramsRegistered,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              l10n.addNewProgram,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

/// 프로그램 선택 아이템 카드
class _ProgramSelectorItem extends StatelessWidget {
  final ActiveProgramEntity program;
  final bool isSelected;
  final VoidCallback onTap;

  const _ProgramSelectorItem({
    required this.program,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primaryContainer
              : theme.cardTheme.color ?? theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.dividerColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 프로그램 제목
                  Text(
                    program.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isSelected
                          ? theme.colorScheme.onPrimaryContainer
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                  // 프로그램 설명 (있는 경우)
                  if (program.shortDescription != null ||
                      program.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      program.shortDescription ??
                          ((program.description?.length ?? 0) > 50
                              ? '${program.description!.substring(0, 50)}...'
                              : program.description ?? ''),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: isSelected
                            ? theme.colorScheme.onPrimaryContainer
                                .withValues(alpha: 0.7)
                            : theme.colorScheme.onSurface
                                .withValues(alpha: 0.6),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.expand_more,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
