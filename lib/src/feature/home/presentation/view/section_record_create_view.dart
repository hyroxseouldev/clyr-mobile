import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/section_record_create_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SectionRecordCategory {
  fortime,
  amraps,
  maxrep,
  maxWeight;

  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case SectionRecordCategory.fortime:
        return l10n.recordCategoryFortime;
      case SectionRecordCategory.amraps:
        return l10n.recordCategoryAmraps;
      case SectionRecordCategory.maxrep:
        return l10n.recordCategoryMaxrep;
      case SectionRecordCategory.maxWeight:
        return l10n.recordCategoryMaxWeight;
    }
  }
}

class SectionRecordCreateView extends HookConsumerWidget {
  final String sectionId;
  final String sectionItemId;
  final DateTime selectedDate;

  const SectionRecordCreateView({
    super.key,
    required this.sectionId,
    required this.sectionItemId,
    required this.selectedDate,
  });

  static const String routeName = 'homeSectionRecordCreate';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedCategory = useState<SectionRecordCategory>(
      SectionRecordCategory.fortime,
    );
    final notesController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final controllerState = ref.watch(sectionRecordCreateControllerProvider);
    final isSubmitting = controllerState.isLoading;

    void handleConfirm() {
      if (!formKey.currentState!.validate()) return;

      final content = {
        'category': selectedCategory.value.name,
        'notes': notesController.text,
      };

      ref
          .read(sectionRecordCreateControllerProvider.notifier)
          .createRecord(
            sectionId: sectionId,
            sectionItemId: sectionItemId,
            content: content,
            selectedDate: selectedDate,
            onSuccess: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.workoutLogSaved)));
              Future.delayed(const Duration(seconds: 1), () {
                if (context.mounted) context.pop();
              });
            },
          );
    }

    ref.listen<AsyncValue<void>>(sectionRecordCreateControllerProvider, (
      previous,
      next,
    ) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.workoutLogTitle)),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Category Selector
            InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.category,
                border: const OutlineInputBorder(),
              ),
              child: SegmentedButton<SectionRecordCategory>(
                segments: [
                  ButtonSegment(
                    value: SectionRecordCategory.fortime,
                    label: Text(l10n.recordCategoryFortime),
                  ),
                  ButtonSegment(
                    value: SectionRecordCategory.amraps,
                    label: Text(l10n.recordCategoryAmraps),
                  ),
                  ButtonSegment(
                    value: SectionRecordCategory.maxrep,
                    label: Text(l10n.recordCategoryMaxrep),
                  ),
                  ButtonSegment(
                    value: SectionRecordCategory.maxWeight,
                    label: Text(l10n.recordCategoryMaxWeight),
                  ),
                ],
                selected: {selectedCategory.value},
                onSelectionChanged: (Set<SectionRecordCategory> newSelection) {
                  selectedCategory.value = newSelection.first;
                },
              ),
            ),
            const SizedBox(height: 16),

            // Notes Field
            TextFormField(
              controller: notesController,
              maxLines: null,
              minLines: 8,
              decoration: InputDecoration(
                labelText: l10n.notes,
                hintText: l10n.workoutNotesHint,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.notesRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: Text(l10n.cancel),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: FilledButton(
                    onPressed: isSubmitting ? null : handleConfirm,
                    child: Text(isSubmitting ? l10n.setting : l10n.confirm),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
