import 'package:flutter/material.dart';

/// 코치 프로필 카드 위젯
class CoachProfileCard extends StatelessWidget {
  final String profileUrl;
  final String coachName;
  final String programName;
  final String subtitleText;

  const CoachProfileCard({
    required this.profileUrl,
    required this.coachName,
    required this.programName,
    this.subtitleText = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Coach Avatar
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(profileUrl),
              onBackgroundImageError: (exception, stackTrace) {},
              child: profileUrl.isEmpty
                  ? const Icon(Icons.person, size: 12)
                  : null,
            ),
            const SizedBox(width: 8),
            // Coach Name
            Text(
              subtitleText,
              style: theme.textTheme.bodySmall?.copyWith(),
            ),

            // Coach & Program Info
          ],
        ),
        const SizedBox(height: 4),

        // Program Name
        Text(
          programName,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
