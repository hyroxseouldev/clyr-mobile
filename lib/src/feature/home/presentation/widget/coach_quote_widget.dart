import 'package:flutter/material.dart';

/// 코치의 한마디 위젯
///
/// 코치님의 인사말이나 오늘의 한마디를 보여주는 카드 위젯입니다.
class CoachQuoteWidget extends StatelessWidget {
  final String title;
  final String content;
  final bool enableNewLines;

  const CoachQuoteWidget({
    required this.title,
    required this.content,
    this.enableNewLines = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // 줄바꿈 비활성화면 \n을 공백으로 변환
    final displayContent = enableNewLines ? content : content.replaceAll('\n', ' ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        // 제목 (코치 이름 포함)
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        // 내용
        Text(
          displayContent,
          maxLines: enableNewLines ? 3 : null,
          overflow: enableNewLines ? TextOverflow.ellipsis : null,
          softWrap: true,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
