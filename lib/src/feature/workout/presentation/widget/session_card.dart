import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/// 세션 카드 위젯 (아코디언)
class SessionCard extends StatelessWidget {
  final WorkoutSessionEntity session;
  final bool compact;

  const SessionCard({super.key, required this.session, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: compact ? 8 : 12),
      child: ExpansionTile(
        initiallyExpanded: false,
        dense: compact,
        leading: SizedBox(
          width: compact ? 32 : 40,
          height: compact ? 32 : 40,
          child: CircleAvatar(
            radius: compact ? 16 : 20,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              '${session.orderIndex}',
              style: TextStyle(
                fontSize: compact ? 12 : null,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(
          session.title,
          style: TextStyle(fontSize: compact ? 14 : null),
        ),

        trailing: const Icon(Icons.expand_more),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Html(
              data: session.content ?? '',
              style: {
                "body": Style(
                  fontSize: FontSize(14),
                  padding: HtmlPaddings.zero,
                  margin: Margins.zero,
                ),
                "p": Style(margin: Margins.only(bottom: 8)),
                "div": Style(margin: Margins.only(bottom: 8)),
                "ul": Style(margin: Margins.only(bottom: 8, left: 16)),
                "ol": Style(margin: Margins.only(bottom: 8, left: 16)),
                "li": Style(margin: Margins.only(bottom: 4)),
                "strong": Style(fontWeight: FontWeight.bold),
                "b": Style(fontWeight: FontWeight.bold),
                "h1": Style(
                  fontSize: FontSize(24),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
                "h2": Style(
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
                "h3": Style(
                  fontSize: FontSize(18),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
