import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/enum/enum.dart';
import 'package:clyr_mobile/src/core/enum/record_type_localization.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/section_record_create_controller.dart';
import 'package:clyr_mobile/src/feature/home/presentation/provider/selected_date_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SectionRecordCreateView extends HookConsumerWidget {
  final String sectionId;
  final String sectionItemId;
  final String? recordType;

  const SectionRecordCreateView({
    super.key,
    required this.sectionId,
    required this.sectionItemId,
    this.recordType,
  });

  static const String routeName = 'homeSectionRecordCreate';

  // Available record types for workout logging
  static const availableRecordTypes = [
    RecordType.timeBased,
    RecordType.repBased,
    RecordType.weightBased,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final selectedDate = ref.watch(selectedDateProvider);

    // Parse recordType from query parameter if available
    final initialRecordType = recordType != null
        ? RecordTypeX.fromString(recordType)
        : null;

    // Use initial record type if available and valid, otherwise default to timeBased
    final initialCategory = useMemoized(() {
      if (initialRecordType != null &&
          availableRecordTypes.contains(initialRecordType)) {
        return initialRecordType;
      }
      return RecordType.timeBased;
    }, [initialRecordType]);

    final selectedRecordType = useState<RecordType>(initialCategory);
    final notesController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final controllerState = ref.watch(sectionRecordCreateControllerProvider);
    final isSubmitting = controllerState.isLoading;

    void handleConfirm() {
      if (!formKey.currentState!.validate()) return;

      final content = {
        'category': selectedRecordType.value.value,
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
            // Record Type Selector
            InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.category,
                border: const OutlineInputBorder(),
              ),
              child: SegmentedButton<RecordType>(
                segments: availableRecordTypes.map((type) {
                  return ButtonSegment(
                    value: type,
                    label: Text(type.getLocalizedName(l10n)),
                  );
                }).toList(),
                selected: {selectedRecordType.value},
                onSelectionChanged: (Set<RecordType> newSelection) {
                  selectedRecordType.value = newSelection.first;
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
