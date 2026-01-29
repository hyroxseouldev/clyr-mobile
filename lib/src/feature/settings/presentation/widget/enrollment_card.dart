import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity.dart';
import 'package:clyr_mobile/src/feature/settings/infra/entity/enrollment_entity_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EnrollmentCard extends StatelessWidget {
  final EnrollmentEntity enrollment;

  const EnrollmentCard({super.key, required this.enrollment});

  factory EnrollmentCard.fromEntity(EnrollmentEntity enrollment) {
    return EnrollmentCard(enrollment: enrollment);
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('yyyy.MM.dd');
    final fullDateFormat = DateFormat('yyyy.MM.dd HH:mm');

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단: 상태와 날짜
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatusChip(context, enrollment.status),
                Text(
                  fullDateFormat.format(enrollment.createdAt),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey.shade600),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 프로그램 ID
            Text(
              '프로그램 ID: ${enrollment.programId}',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 8),

            // 시작일
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(width: 8),
                Text(
                  '시작일: ${dateFormat.format(enrollment.startDate)}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade700,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusChip(BuildContext context, EnrollmentStatus status) {
    final l10n = AppLocalizations.of(context)!;

    Color backgroundColor;
    Color textColor;

    switch (status) {
      case EnrollmentStatus.active:
        backgroundColor = Colors.green.shade100;
        textColor = Colors.green.shade800;
        break;
      case EnrollmentStatus.inactive:
        backgroundColor = Colors.grey.shade200;
        textColor = Colors.grey.shade800;
        break;
      case EnrollmentStatus.cancelled:
        backgroundColor = Colors.red.shade100;
        textColor = Colors.red.shade800;
        break;
      case EnrollmentStatus.expired:
        backgroundColor = Colors.orange.shade100;
        textColor = Colors.orange.shade800;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        status.getLocalizedName(l10n),
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
