import 'package:flutter/material.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/workout_share_bottom_sheet.dart';

class WorkoutShareButton extends StatelessWidget {
  final HealthWorkoutData workout;

  const WorkoutShareButton({required this.workout, super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return IconButton(
      icon: const Icon(Icons.ios_share),
      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints(),
      onPressed: () => _showShareBottomSheet(context, l10n, workout),
    );
  }

  void _showShareBottomSheet(
    BuildContext context,
    AppLocalizations l10n,
    HealthWorkoutData workout,
  ) {
    WorkoutShareBottomSheet.show(
      context,
      workout: workout,
      closeText: l10n.cancel,
      downloadText: l10n.shareDownload,
      shareToKakaoText: l10n.shareToKakao,
      shareToInstagramText: l10n.shareToInstagram,
      simpleLabel: l10n.shareSimpleDesign,
      detailedLabel: l10n.shareDetailedDesign,
      transparentLabel: l10n.shareTransparentDesign,
      downloadSuccessText: l10n.shareDownloadSuccess,
      downloadErrorText: l10n.shareDownloadError,
    );
  }
}
