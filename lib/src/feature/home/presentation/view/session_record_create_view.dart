import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

enum SessionRecordCategory {
  fortime,
  amraps,
  maxrep,
  maxWeight;

  String getLocalizedName(AppLocalizations l10n) {
    switch (this) {
      case SessionRecordCategory.fortime:
        return l10n.recordCategoryFortime;
      case SessionRecordCategory.amraps:
        return l10n.recordCategoryAmraps;
      case SessionRecordCategory.maxrep:
        return l10n.recordCategoryMaxrep;
      case SessionRecordCategory.maxWeight:
        return l10n.recordCategoryMaxWeight;
    }
  }
}

class SessionRecordCreateView extends HookWidget {
  final String sessionId;

  const SessionRecordCreateView({
    super.key,
    required this.sessionId,
  });

  static const String routeName = 'homeSessionRecordCreate';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedCategory =
        useState<SessionRecordCategory>(SessionRecordCategory.fortime);
    final notesController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    void handleConfirm() {
      if (!formKey.currentState!.validate()) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${l10n.category}: ${selectedCategory.value.getLocalizedName(l10n)}\n'
            '${l10n.notes}: ${notesController.text}',
          ),
          duration: const Duration(seconds: 3),
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        if (context.mounted) context.pop();
      });
    }

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
              child: SegmentedButton<SessionRecordCategory>(
                segments: [
                  ButtonSegment(
                    value: SessionRecordCategory.fortime,
                    label: Text(l10n.recordCategoryFortime),
                  ),
                  ButtonSegment(
                    value: SessionRecordCategory.amraps,
                    label: Text(l10n.recordCategoryAmraps),
                  ),
                  ButtonSegment(
                    value: SessionRecordCategory.maxrep,
                    label: Text(l10n.recordCategoryMaxrep),
                  ),
                  ButtonSegment(
                    value: SessionRecordCategory.maxWeight,
                    label: Text(l10n.recordCategoryMaxWeight),
                  ),
                ],
                selected: {selectedCategory.value},
                onSelectionChanged: (Set<SessionRecordCategory> newSelection) {
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
                    onPressed: handleConfirm,
                    child: Text(l10n.confirm),
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
