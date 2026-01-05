import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:flutter/material.dart';

/// 세션 카드 위젯
class SessionCard extends StatelessWidget {
  final WorkoutSessionEntity session;
  final bool compact;

  const SessionCard({super.key, required this.session, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: compact ? 8 : 12),
      child: ListTile(
        dense: compact,
        leading: SizedBox(
          width: compact ? 32 : 40,
          height: compact ? 32 : 40,
          child: CircleAvatar(
            radius: compact ? 16 : 20,
            child: Text(
              '${session.orderIndex}',
              style: TextStyle(fontSize: compact ? 12 : null),
            ),
          ),
        ),
        title: Text(
          session.title,
          style: TextStyle(fontSize: compact ? 14 : null),
        ),
        subtitle: session.content != null
            ? Text(
                session.content!,
                style: TextStyle(fontSize: compact ? 12 : null),
              )
            : null,
        trailing: compact ? const Icon(Icons.chevron_right, size: 18) : null,
      ),
    );
  }
}
