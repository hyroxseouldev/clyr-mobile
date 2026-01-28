import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/onboarding_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnboardingView extends HookConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    // State hooks
    final currentStep = useState<int>(0);
    final selectedGender = useState<Gender?>(null);
    final selectedExercise = useState<ExerciseType?>(null);
    final selectedExperience = useState<ExperienceLevel?>(null);

    // Total steps constant
    const totalSteps = 4;

    // Listen to controller state changes
    ref.listen<AsyncValue>(
      onboardingControllerProvider,
      (previous, next) {
        next.when(
          data: (_) {
            context.go(RoutePaths.home);
          },
          error: (error, _) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $error')),
            );
          },
          loading: () {},
        );
      },
    );

    // Helper functions
    bool canProceedToNextStep() {
      switch (currentStep.value) {
        case 0:
          return selectedGender.value != null;
        case 1:
          return selectedExercise.value != null;
        case 2:
          return selectedExperience.value != null;
        case 3:
          // Completion step - always can proceed (to submit)
          return true;
        default:
          return false;
      }
    }

    void goToNextStep() {
      if (canProceedToNextStep()) {
        currentStep.value++;
      }
    }

    void goToPreviousStep() {
      if (currentStep.value > 0) {
        currentStep.value--;
      }
    }

    void onSubmit() {
      if (selectedGender.value == null ||
          selectedExercise.value == null ||
          selectedExperience.value == null) {
        return;
      }

      ref.read(onboardingControllerProvider.notifier).completeOnboarding(
            gender: selectedGender.value!,
            exerciseType: selectedExercise.value!,
            experience: selectedExperience.value!,
          );
    }

    final controllerState = ref.watch(onboardingControllerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Progress Indicator
            _buildProgressIndicator(
              context,
              l10n,
              currentStep.value,
              totalSteps,
            ),
            // Header (welcome text - only on first step)
            if (currentStep.value == 0) _buildWelcomeHeader(context, l10n),
            // Step Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TweenAnimationBuilder<double>(
                  key: ValueKey(currentStep.value),
                  tween: Tween(begin: 0, end: 1),
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: Transform.translate(
                        offset: Offset(0, -30 * (1 - value)),
                        child: child,
                      ),
                    );
                  },
                  child: _buildStepContent(
                    context,
                    currentStep.value,
                    l10n,
                    selectedGender,
                    selectedExercise,
                    selectedExperience,
                  ),
                ),
              ),
            ),
            // Navigation Buttons
            _buildNavigationButtons(
              context,
              controllerState,
              l10n,
              currentStep.value,
              totalSteps,
              canProceedToNextStep,
              goToNextStep,
              goToPreviousStep,
              onSubmit,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(
    BuildContext context,
    AppLocalizations l10n,
    int currentStep,
    int totalSteps,
  ) {
    final progress = (currentStep + 1) / totalSteps;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          // Animated progress bar
          TweenAnimationBuilder<double>(
            key: ValueKey(currentStep),
            tween: Tween(begin: (currentStep) / totalSteps, end: progress),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return LinearProgressIndicator(
                value: value,
                minHeight: 8,
                borderRadius: BorderRadius.circular(4),
                backgroundColor: Colors.grey[300],
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            l10n.onboardingStep(currentStep + 1, totalSteps),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeHeader(
    BuildContext context,
    AppLocalizations l10n,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.onboardingWelcome,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            l10n.onboardingSubtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(
    BuildContext context,
    int step,
    AppLocalizations l10n,
    ValueNotifier<Gender?> selectedGender,
    ValueNotifier<ExerciseType?> selectedExercise,
    ValueNotifier<ExperienceLevel?> selectedExperience,
  ) {
    switch (step) {
      case 0:
        return _buildGenderStep(context, l10n, selectedGender);
      case 1:
        return _buildExerciseStep(context, l10n, selectedExercise);
      case 2:
        return _buildExperienceStep(context, l10n, selectedExperience);
      case 3:
        return _buildCompletionStep(
          context,
          l10n,
          selectedGender.value,
          selectedExercise.value,
          selectedExperience.value,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildGenderStep(
    BuildContext context,
    AppLocalizations l10n,
    ValueNotifier<Gender?> selectedGender,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.onboardingGender,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ...[
          (l10n.genderMale, Gender.male),
          (l10n.genderFemale, Gender.female),
        ].asMap().entries.map((entry) {
          final e = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _GenderOption(
              label: e.$1,
              isSelected: selectedGender.value == e.$2,
              onTap: () => selectedGender.value = e.$2,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildExerciseStep(
    BuildContext context,
    AppLocalizations l10n,
    ValueNotifier<ExerciseType?> selectedExercise,
  ) {
    final exercises = [
      (ExerciseType.hyrox, l10n.exerciseHyrox),
      (ExerciseType.crossfit, l10n.exerciseCrossfit),
      (ExerciseType.running, l10n.exerciseRunning),
      (ExerciseType.gym, l10n.exerciseGym),
      (ExerciseType.other, l10n.exerciseOther),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.onboardingExerciseType,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ...exercises.asMap().entries.map((entry) {
          final e = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ExerciseChip(
              label: e.$2,
              isSelected: selectedExercise.value == e.$1,
              onTap: () => selectedExercise.value = e.$1,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildExperienceStep(
    BuildContext context,
    AppLocalizations l10n,
    ValueNotifier<ExperienceLevel?> selectedExperience,
  ) {
    final experiences = [
      (ExperienceLevel.less3m, l10n.experienceLess3m),
      (ExperienceLevel.less6m, l10n.experienceLess6m),
      (ExperienceLevel.less1y, l10n.experienceLess1y),
      (ExperienceLevel.more1y, l10n.experienceMore1y),
      (ExperienceLevel.more3y, l10n.experienceMore3y),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.onboardingExperience,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ...experiences.asMap().entries.map((entry) {
          final e = entry.value;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _ExperienceOption(
              label: e.$2,
              isSelected: selectedExperience.value == e.$1,
              onTap: () => selectedExperience.value = e.$1,
            ),
          );
        }),
      ],
    );
  }

  Widget _buildCompletionStep(
    BuildContext context,
    AppLocalizations l10n,
    Gender? gender,
    ExerciseType? exercise,
    ExperienceLevel? experience,
  ) {
    return _CompletionStepWidget(
      l10n: l10n,
      gender: gender,
      exercise: exercise,
      experience: experience,
    );
  }

  Widget _buildNavigationButtons(
    BuildContext context,
    AsyncValue controllerState,
    AppLocalizations l10n,
    int currentStep,
    int totalSteps,
    bool Function() canProceedToNextStep,
    VoidCallback goToNextStep,
    VoidCallback goToPreviousStep,
    VoidCallback onSubmit,
  ) {
    final isLastStep = currentStep == totalSteps - 1;
    final canGoNext = canProceedToNextStep();
    // Don't show back button on completion step (step 3)
    final showBackButton = currentStep > 0 && currentStep < totalSteps - 1;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          if (showBackButton)
            Expanded(
              child: OutlinedButton(
                onPressed: goToPreviousStep,
                child: Text(l10n.onboardingBack),
              ),
            ),
          if (showBackButton) const SizedBox(width: 12),
          Expanded(
            child: FilledButton(
              onPressed: (canGoNext && !controllerState.isLoading)
                  ? (isLastStep ? onSubmit : goToNextStep)
                  : null,
              child: controllerState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(isLastStep ? l10n.onboardingCompleteStart : l10n.onboardingNext),
            ),
          ),
        ],
      ),
    );
  }
}

class _GenderOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExerciseChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ExerciseChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceOption extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _ExperienceOption({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Fade-in slide animation widget
class _AnimatedSlideIn extends StatelessWidget {
  final Widget child;
  final Duration delay;
  final Offset offset;

  const _AnimatedSlideIn({
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, -0.5),
  });

  @override
  Widget build(BuildContext context) {
    if (delay == Duration.zero) {
      return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: offset * (1 - value),
              child: child,
            ),
          );
        },
        child: child,
      );
    }

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500) + delay,
      curve: Interval(delay.inMilliseconds / 500, 1, curve: Curves.easeOut),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: offset * (1 - value),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

/// Summary row widget for completion page
class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}

/// Completion step widget showing summary
class _CompletionStepWidget extends StatelessWidget {
  final AppLocalizations l10n;
  final Gender? gender;
  final ExerciseType? exercise;
  final ExperienceLevel? experience;

  const _CompletionStepWidget({
    required this.l10n,
    required this.gender,
    required this.exercise,
    required this.experience,
  });

  String _genderToString() {
    if (gender == null) return '-';
    return switch (gender!) {
      Gender.male => l10n.genderMale,
      Gender.female => l10n.genderFemale,
      Gender.other => l10n.exerciseOther,
    };
  }

  String _exerciseToString() {
    if (exercise == null) return '-';
    return switch (exercise!) {
      ExerciseType.hyrox => l10n.exerciseHyrox,
      ExerciseType.crossfit => l10n.exerciseCrossfit,
      ExerciseType.running => l10n.exerciseRunning,
      ExerciseType.gym => l10n.exerciseGym,
      ExerciseType.other => l10n.exerciseOther,
    };
  }

  String _experienceToString() {
    if (experience == null) return '-';
    return switch (experience!) {
      ExperienceLevel.less3m => l10n.experienceLess3m,
      ExperienceLevel.less6m => l10n.experienceLess6m,
      ExperienceLevel.less1y => l10n.experienceLess1y,
      ExperienceLevel.more1y => l10n.experienceMore1y,
      ExperienceLevel.more3y => l10n.experienceMore3y,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Success icon with animation
        _AnimatedSlideIn(
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        const SizedBox(height: 32),
        _AnimatedSlideIn(
          delay: const Duration(milliseconds: 100),
          child: Text(
            l10n.onboardingCompleteTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        _AnimatedSlideIn(
          delay: const Duration(milliseconds: 200),
          child: Text(
            l10n.onboardingCompleteSubtitle,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        _AnimatedSlideIn(
          delay: const Duration(milliseconds: 300),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _SummaryRow(label: "성별", value: _genderToString()),
                  const Divider(height: 24),
                  _SummaryRow(label: "운동", value: _exerciseToString()),
                  const Divider(height: 24),
                  _SummaryRow(label: "경력", value: _experienceToString()),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _AnimatedSlideIn(
          delay: const Duration(milliseconds: 400),
          child: Text(
            l10n.onboardingCompleteReady,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[700],
                ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
