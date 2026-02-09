import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_detail_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/workout_detail_widget.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/workout_share_bottom_sheet.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';

class HomeWorkoutDetailView extends ConsumerWidget {
  const HomeWorkoutDetailView({super.key, required this.workoutId});
  static const routeName = 'home_workout_detail';
  final String workoutId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final workoutState = ref.watch(workoutDetailProvider(workoutId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _showShareBottomSheet(context, ref, l10n),
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: AsyncWidget<HealthWorkoutData?>(
        data: workoutState,
        builder: (workout) {
          if (workout == null) {
            return _buildNotFound(context, l10n);
          }

          return WorkoutDetailWidget(
            workout: workout,
            workoutTypeText: l10n.workoutType,
            durationText: l10n.duration,
            startTimeText: l10n.startTime,
            endTimeText: l10n.endTime,
            distanceText: l10n.distance,
            caloriesText: l10n.calories,
            metadataText: l10n.metadata,
            notAvailableText: l10n.notAvailable,
          );
        },
      ),
    );
  }

  Widget _buildNotFound(BuildContext context, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64),
          const SizedBox(height: 16),
          Text(
            l10n.workoutNotFound,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  void _showShareBottomSheet(BuildContext context, WidgetRef ref, AppLocalizations l10n) {
    // Workout data is already loaded from workoutState
    // We need to get it from the provider directly
    final workoutAsync = ref.read(workoutDetailProvider(workoutId));
    final workout = workoutAsync.value;

    if (workout == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('운동 정보를 불러오는 중입니다...')),
      );
      return;
    }

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
