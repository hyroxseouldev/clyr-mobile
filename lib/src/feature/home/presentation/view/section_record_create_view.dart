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
    RecordType.distanceBased,
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

    // Time-based controllers
    final hoursController = useTextEditingController();
    final minutesController = useTextEditingController();
    final secondsController = useTextEditingController();

    // Rep-based controllers
    final roundsController = useTextEditingController();
    final repsController = useTextEditingController();

    // Weight-based controller
    final weightController = useTextEditingController();

    // Distance-based controller
    final distanceController = useTextEditingController();

    final formKey = useMemoized(() => GlobalKey<FormState>());

    final controllerState = ref.watch(sectionRecordCreateControllerProvider);
    final isSubmitting = controllerState.isLoading;

    IconData _getIconForType(RecordType type) {
      switch (type) {
        case RecordType.timeBased:
          return Icons.schedule;
        case RecordType.repBased:
          return Icons.repeat;
        case RecordType.weightBased:
          return Icons.fitness_center;
        case RecordType.distanceBased:
          return Icons.straighten;
        default:
          return Icons.category;
      }
    }

    Widget _buildNumberField({
      required String label,
      required int maxValue,
      TextEditingController? controller,
    }) {
      return TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          isDense: true,
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label을 입력해주세요';
          }
          final number = int.tryParse(value);
          if (number == null || number < 0) {
            return '유효한 숫자를 입력해주세요';
          }
          if (number > maxValue) {
            return '$maxValue 이하의 값을 입력해주세요';
          }
          return null;
        },
      );
    }

    Widget _buildTypeSpecificInputs(RecordType type) {
      switch (type) {
        case RecordType.timeBased:
          return Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  label: '시간',
                  maxValue: 23,
                  controller: hoursController,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNumberField(
                  label: '분',
                  maxValue: 59,
                  controller: minutesController,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNumberField(
                  label: '초',
                  maxValue: 59,
                  controller: secondsController,
                ),
              ),
            ],
          );
        case RecordType.repBased:
          return Row(
            children: [
              Expanded(
                child: _buildNumberField(
                  label: 'Round',
                  maxValue: 99,
                  controller: roundsController,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _buildNumberField(
                  label: 'Rep',
                  maxValue: 999,
                  controller: repsController,
                ),
              ),
            ],
          );
        case RecordType.weightBased:
          return _buildNumberField(
            label: 'kg',
            maxValue: 999,
            controller: weightController,
          );
        case RecordType.distanceBased:
          return _buildNumberField(
            label: 'm',
            maxValue: 99999,
            controller: distanceController,
          );
        default:
          return const SizedBox.shrink();
      }
    }

    String _formatNotes(RecordType type) {
      switch (type) {
        case RecordType.timeBased:
          final h = hoursController.text.trim();
          final m = minutesController.text.trim();
          final s = secondsController.text.trim();
          // Format as hh:mm:ss
          return '${h.padLeft(2, '0')}:${m.padLeft(2, '0')}:${s.padLeft(2, '0')}';
        case RecordType.repBased:
          final r = roundsController.text.trim();
          final rep = repsController.text.trim();
          return '$r Round $rep Rep';
        case RecordType.weightBased:
          final kg = weightController.text.trim();
          return '$kg kg';
        case RecordType.distanceBased:
          final m = distanceController.text.trim();
          return '$m m';
        default:
          return '';
      }
    }

    void handleConfirm() {
      if (!formKey.currentState!.validate()) return;

      final notes = _formatNotes(selectedRecordType.value);

      final content = {
        'recordType': selectedRecordType.value.value,
        'record': notes,
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
            // Record Type Display (Fixed, not changeable)
            InputDecorator(
              decoration: InputDecoration(
                labelText: l10n.category,
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest,
              ),
              child: Row(
                children: [
                  Icon(_getIconForType(selectedRecordType.value)),
                  const SizedBox(width: 8),
                  Text(selectedRecordType.value.getLocalizedName(l10n)),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Type-Specific Input Fields
            _buildTypeSpecificInputs(selectedRecordType.value),
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
