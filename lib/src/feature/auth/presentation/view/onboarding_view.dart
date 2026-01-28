import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/onboarding_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingView extends ConsumerStatefulWidget {
  const OnboardingView({super.key});

  @override
  ConsumerState<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends ConsumerState<OnboardingView> {
  Gender? _selectedGender;
  ExerciseType? _selectedExercise;
  ExperienceLevel? _selectedExperience;

  void _onSubmit() {
    if (_selectedGender == null ||
        _selectedExercise == null ||
        _selectedExperience == null) {
      // Show validation error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.pleaseFillAllFields)),
      );
      return;
    }

    ref.read(onboardingControllerProvider.notifier).completeOnboarding(
          gender: _selectedGender!,
          exerciseType: _selectedExercise!,
          experience: _selectedExperience!,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controllerState = ref.watch(onboardingControllerProvider);

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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(24),
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
            ),
            // Form fields
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  _buildGenderSelector(context),
                  const SizedBox(height: 24),
                  _buildExerciseSelector(context),
                  const SizedBox(height: 24),
                  _buildExperienceSelector(context),
                  const SizedBox(height: 32),
                ],
              ),
            ),
            // Start button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: controllerState.isLoading ? null : _onSubmit,
                  child: controllerState.isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.onboardingStart),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSelector(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.onboardingGender,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _GenderOption(
                label: l10n.genderMale,
                isSelected: _selectedGender == Gender.male,
                onTap: () => setState(() => _selectedGender = Gender.male),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _GenderOption(
                label: l10n.genderFemale,
                isSelected: _selectedGender == Gender.female,
                onTap: () => setState(() => _selectedGender = Gender.female),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildExerciseSelector(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final exercises = [
      (ExerciseType.hyrox, l10n.exerciseHyrox),
      (ExerciseType.crossfit, l10n.exerciseCrossfit),
      (ExerciseType.running, l10n.exerciseRunning),
      (ExerciseType.gym, l10n.exerciseGym),
      (ExerciseType.other, l10n.exerciseOther),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.onboardingExerciseType,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: exercises
              .map((e) => _ExerciseChip(
                    label: e.$2,
                    isSelected: _selectedExercise == e.$1,
                    onTap: () => setState(() => _selectedExercise = e.$1),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildExperienceSelector(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final experiences = [
      (ExperienceLevel.less3m, l10n.experienceLess3m),
      (ExperienceLevel.less6m, l10n.experienceLess6m),
      (ExperienceLevel.less1y, l10n.experienceLess1y),
      (ExperienceLevel.more1y, l10n.experienceMore1y),
      (ExperienceLevel.more3y, l10n.experienceMore3y),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.onboardingExperience,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        ...experiences.map((e) => _ExperienceOption(
              label: e.$2,
              isSelected: _selectedExperience == e.$1,
              onTap: () => setState(() => _selectedExperience = e.$1),
            )),
      ],
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
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
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: Theme.of(context).colorScheme.primaryContainer,
      checkmarkColor: Theme.of(context).colorScheme.primary,
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
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(8),
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
            ),
            const SizedBox(width: 12),
            Text(label),
          ],
        ),
      ),
    );
  }
}
