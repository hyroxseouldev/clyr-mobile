import 'package:flutter/material.dart';

/// 프로그램 진행률 프로그레스 바 위젯
///
/// UX 디자인 원칙:
/// - 명확한 시각적 계층 구조 (제목 → 프로그레스 바 → 라벨)
/// - Primary 컬러 활용으로 브랜드 아이덴티티 유지
/// - "완료" 텍스트로 인간적인 피드백 제공
class ProgramProgressBar extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final DateTime today;
  final Color? primaryColor;
  final String completedText;

  const ProgramProgressBar({
    required this.startDate,
    required this.endDate,
    required this.today,
    this.primaryColor,
    this.completedText = '완료됨',
    super.key,
  });

  /// 진행률 계산 (0.0 ~ 1.0)
  double get _progress {
    if (endDate.isBefore(startDate)) return 0.0;
    if (today.isBefore(startDate)) return 0.0;
    if (today.isAfter(endDate)) return 1.0;

    final totalDays = endDate.difference(startDate).inDays + 1;
    final elapsedDays = today.difference(startDate).inDays + 1;
    return elapsedDays / totalDays;
  }

  /// 진행률 퍼센트
  int get _progressPercent => (_progress * 100).round();

  /// 완료 상태 여부
  bool get _isCompleted => _progress >= 1.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = primaryColor ?? theme.colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                children: [
                  // 배경 바
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  // 진행 바 (그라데이션 효과)
                  FractionallySizedBox(
                    widthFactor: _progress,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color, color.withValues(alpha: 0.8)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                // 현재 진행률 위치에 맞춰 라벨 배치
                _isCompleted
                    ? const SizedBox.shrink()
                    : Transform.translate(
                        offset: Offset(-30.0 * (_progress - 0.5), 0),
                        child: Text(
                          '$_progressPercent%',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ),
                Text(
                  completedText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: _isCompleted ? color : Colors.grey[700],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
