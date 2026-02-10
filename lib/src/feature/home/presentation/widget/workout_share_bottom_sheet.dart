import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_share_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_share_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/share_action_buttons.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/share_image_carousel.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:typed_data';

/// Workout share bottom sheet
/// Main UI for sharing workout images
class WorkoutShareBottomSheet extends HookConsumerWidget {
  final HealthWorkoutData workout;

  // All localized strings passed as parameters
  final String closeText;
  final String downloadText;
  final String shareToKakaoText;
  final String shareToInstagramText;
  final String simpleLabel;
  final String detailedLabel;
  final String transparentLabel;
  final String downloadSuccessText;
  final String downloadErrorText;

  const WorkoutShareBottomSheet({
    super.key,
    required this.workout,
    required this.closeText,
    required this.downloadText,
    required this.shareToKakaoText,
    required this.shareToInstagramText,
    required this.simpleLabel,
    required this.detailedLabel,
    required this.transparentLabel,
    required this.downloadSuccessText,
    required this.downloadErrorText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageState = ref.watch(workoutShareProvider(workout));
    final actionLoadingState = ref.watch(workoutShareControllerProvider);
    final selectedIndex = useState(0);

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Close button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),

          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '운동 공유',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Image carousel
          Expanded(
            child: AsyncWidget<List>(
              data: imageState,
              builder: (images) {
                if (images.isEmpty) {
                  return const Center(child: Text('이미지가 없습니다'));
                }

                return ShareImageCarousel(
                  images: images
                      .map((e) => e.imageBytes)
                      .cast<Uint8List>()
                      .toList(),
                  simpleLabel: simpleLabel,
                  detailedLabel: detailedLabel,
                  transparentLabel: transparentLabel,
                  selectedIndex: selectedIndex.value,
                  onSelectedIndexChanged: (index) {
                    selectedIndex.value = index;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Action buttons
          ShareActionButtons(
            onDownload: () =>
                _handleDownload(context, ref, selectedIndex.value),
            onShareKakao: () => _handleShareKakao(ref, selectedIndex.value),
            onShareInstagram: () =>
                _handleShareInstagram(ref, selectedIndex.value),
            downloadText: downloadText,
            shareToKakaoText: shareToKakaoText,
            shareToInstagramText: shareToInstagramText,
            isDownloading: actionLoadingState.isLoading,
            isSharing: actionLoadingState.isLoading,
          ),
        ],
      ),
    );
  }

  Future<void> _handleDownload(
    BuildContext context,
    WidgetRef ref,
    int index,
  ) async {
    await ref
        .read(workoutShareControllerProvider.notifier)
        .downloadImage(workout, index);

    // Show feedback
    if (context.mounted) {
      final state = ref.read(workoutShareControllerProvider);
      if (state.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(downloadErrorText)));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(downloadSuccessText)));
      }
    }
  }

  Future<void> _handleShareKakao(WidgetRef ref, int index) async {
    await ref
        .read(workoutShareControllerProvider.notifier)
        .shareToKakao(workout, index);
  }

  Future<void> _handleShareInstagram(WidgetRef ref, int index) async {
    await ref
        .read(workoutShareControllerProvider.notifier)
        .shareToInstagram(workout, index);
  }

  /// Show the bottom sheet
  static Future<void> show(
    BuildContext context, {
    required HealthWorkoutData workout,
    required String closeText,
    required String downloadText,
    required String shareToKakaoText,
    required String shareToInstagramText,
    required String simpleLabel,
    required String detailedLabel,
    required String transparentLabel,
    required String downloadSuccessText,
    required String downloadErrorText,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => WorkoutShareBottomSheet(
        workout: workout,
        closeText: closeText,
        downloadText: downloadText,
        shareToKakaoText: shareToKakaoText,
        shareToInstagramText: shareToInstagramText,
        simpleLabel: simpleLabel,
        detailedLabel: detailedLabel,
        transparentLabel: transparentLabel,
        downloadSuccessText: downloadSuccessText,
        downloadErrorText: downloadErrorText,
      ),
    );
  }
}
