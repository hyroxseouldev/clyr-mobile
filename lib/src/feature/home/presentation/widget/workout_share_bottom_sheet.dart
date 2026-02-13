import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/health/entity/health_workout_data.dart';
import 'package:clyr_mobile/src/core/share/entity/share_image_entity.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_share_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/workout_share_provider.dart';
import 'package:clyr_mobile/src/feature/home/presentation/widget/share_image_carousel.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Workout share bottom sheet
/// Main UI for sharing workout images
class WorkoutShareBottomSheet extends HookConsumerWidget {
  final HealthWorkoutData workout;
  final List<ShareImageStyle> styles;

  const WorkoutShareBottomSheet({
    super.key,
    required this.workout,
    this.styles = ShareImageStyle.values,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final imageState = ref.watch(workoutShareProvider(workout, styles: styles));
    final selectedIndex = useState(0);
    final feedback = useState<_DownloadFeedback?>(null);
    final feedbackVersion = useState(0);

    // Listen to controller state for feedback
    ref.listen(workoutShareControllerProvider, (previous, next) {
      if (!next.isLoading && previous?.isLoading == true) {
        feedbackVersion.value++;
        final currentVersion = feedbackVersion.value;

        if (next.hasError) {
          feedback.value = _DownloadFeedback(
            message: l10n.shareDownloadError,
            isError: true,
          );
        } else if (previous != null) {
          feedback.value = _DownloadFeedback(
            message: l10n.shareDownloadSuccess,
            isError: false,
          );
        }

        Future<void>.delayed(const Duration(milliseconds: 2500), () {
          if (!context.mounted || feedbackVersion.value != currentVersion) {
            return;
          }
          feedback.value = null;
        });
      }
    });

    return Container(
      height: MediaQuery.of(context).size.height * 0.775,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Close button
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 20),
                ),
              ],
            ),
          ),

          // Image carousel and actions (wrapped in AsyncWidget for loading state)
          Expanded(
            child: AsyncWidget<List<ShareImageEntity>>(
              data: imageState,
              builder: (images) {
                if (images.isEmpty) {
                  return EmptyState(text: l10n.shareNoImages);
                }

                return Column(
                  children: [
                    ShareImageCarousel(
                      images: images.map((e) => e.imageBytes).toList(),
                      styles: images.map((e) => e.style).toList(),
                      selectedIndex: selectedIndex.value,
                      onSelectedIndexChanged: (index) {
                        selectedIndex.value = index;
                      },
                    ),
                    const SizedBox(height: 16),

                    /// Heading text 'share to' left
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          'Share to',
                          style: Theme.of(context).textTheme.titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // Action buttons
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  IconButton.filledTonal(
                                    onPressed: () => _handleDownload(
                                      context,
                                      ref,
                                      images[selectedIndex.value],
                                    ),
                                    icon: const Icon(Icons.save_alt),
                                  ),
                                  Text(
                                    'Save',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 180),
                            child: feedback.value == null
                                ? const SizedBox.shrink()
                                : Container(
                                    key: ValueKey<String>(
                                      feedback.value!.message,
                                    ),
                                    margin: const EdgeInsets.only(top: 8),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: feedback.value!.isError
                                          ? Theme.of(
                                              context,
                                            ).colorScheme.errorContainer
                                          : Theme.of(
                                              context,
                                            ).colorScheme.secondaryContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          feedback.value!.isError
                                              ? Icons.error_outline
                                              : Icons.check_circle_outline,
                                          size: 18,
                                          color: feedback.value!.isError
                                              ? Theme.of(
                                                  context,
                                                ).colorScheme.onErrorContainer
                                              : Theme.of(context)
                                                    .colorScheme
                                                    .onSecondaryContainer,
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            feedback.value!.message,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color: feedback.value!.isError
                                                      ? Theme.of(context)
                                                            .colorScheme
                                                            .onErrorContainer
                                                      : Theme.of(context)
                                                            .colorScheme
                                                            .onSecondaryContainer,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),

          // Container(
          //   color: Theme.of(context).colorScheme.surface,
          //   padding: const EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: Theme.of(context).colorScheme.outline,
          //     ),
          //   ),
          //   child: Icon(Icons.save_alt_outlined, size: 24),
          // ),
        ],
      ),
    );
  }

  Future<void> _handleDownload(
    BuildContext context,
    WidgetRef ref,
    ShareImageEntity image,
  ) async {
    await ref
        .read(workoutShareControllerProvider.notifier)
        .downloadImage(image);
  }

  /// Show the bottom sheet
  static Future<void> show(
    BuildContext context, {
    required HealthWorkoutData workout,
    List<ShareImageStyle> styles = ShareImageStyle.values,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          WorkoutShareBottomSheet(workout: workout, styles: styles),
    );
  }
}

class _DownloadFeedback {
  const _DownloadFeedback({required this.message, required this.isError});

  final String message;
  final bool isError;
}
