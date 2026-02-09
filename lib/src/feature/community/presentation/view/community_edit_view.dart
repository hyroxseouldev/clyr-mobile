import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:clyr_mobile/src/feature/community/infra/entity/community_entity.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_form_controller.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';

/// Community edit view - form to edit existing community
class CommunityEditView extends ConsumerWidget {
  const CommunityEditView({super.key, required this.communityId});
  static const routeName = 'community_edit';
  final String communityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formState = ref.watch(communityFormProvider(communityId: communityId));

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.modify),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(l10n.cancel),
          ),
        ],
      ),
      body: AsyncWidget<CommunityEntity?>(
        data: formState,
        builder: (community) {
          if (community == null) {
            return const Center(child: Text('Community not found')); // TODO: l10n
          }
          return _CommunityEditForm(
            community: community,
            l10n: l10n,
          );
        },
      ),
    );
  }
}

class _CommunityEditForm extends HookConsumerWidget {
  const _CommunityEditForm({
    required this.community,
    required this.l10n,
  });

  final CommunityEntity community;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController(text: community.title);
    final contentController = useTextEditingController(text: community.content);
    final locationController = useTextEditingController(text: community.location);
    final selectedDateState = useState<DateTime?>(community.eventDate);
    final maxParticipantsState = useState<int>(community.maxParticipants);
    final isSubmittingState = useState<bool>(false);

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: l10n.title,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.titleRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Content
            TextFormField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: l10n.notes,
                border: const OutlineInputBorder(),
              ),
              maxLines: 5,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l10n.notesRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Event Date
            InkWell(
              onTap: () => _selectDateTime(context, selectedDateState),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: l10n.communityEventDate,
                  border: const OutlineInputBorder(),
                ),
                child: Text(
                  selectedDateState.value != null
                      ? '${selectedDateState.value!.year}-${selectedDateState.value!.month.toString().padLeft(2, '0')}-${selectedDateState.value!.day.toString().padLeft(2, '0')} '
                        '${selectedDateState.value!.hour.toString().padLeft(2, '0')}:${selectedDateState.value!.minute.toString().padLeft(2, '0')}'
                      : 'Select date and time', // TODO: l10n
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Location
            TextFormField(
              controller: locationController,
              decoration: InputDecoration(
                labelText: l10n.communityLocation,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Location is required'; // TODO: l10n
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Max Participants
            Text('${l10n.communityMaxParticipants}: ${maxParticipantsState.value}'),
            Slider(
              value: maxParticipantsState.value.toDouble(),
              min: 2,
              max: 100,
              divisions: 98,
              label: '${maxParticipantsState.value}',
              onChanged: (value) {
                maxParticipantsState.value = value.toInt();
              },
            ),
            const SizedBox(height: 24),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: isSubmittingState.value ? null : () => _handleSubmit(context, ref, isSubmittingState, titleController, contentController, selectedDateState, locationController, maxParticipantsState),
                child: isSubmittingState.value
                    ? const CircularProgressIndicator()
                    : Text(l10n.save),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateTime(
    BuildContext context,
    ValueNotifier<DateTime?> selectedDate,
  ) async {
    final now = DateTime.now();
    final firstDate = now;
    final lastDate = DateTime(now.year + 1);

    final datePicked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (datePicked == null) return;

    final timePicked = await showTimePicker(
      context: context,
      initialTime: selectedDate.value != null
          ? TimeOfDay(hour: selectedDate.value!.hour, minute: selectedDate.value!.minute)
          : TimeOfDay.now(),
    );

    if (timePicked == null) return;

    selectedDate.value = DateTime(
      datePicked.year,
      datePicked.month,
      datePicked.day,
      timePicked.hour,
      timePicked.minute,
    );
  }

  Future<void> _handleSubmit(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isSubmittingState,
    TextEditingController titleController,
    TextEditingController contentController,
    ValueNotifier<DateTime?> selectedDate,
    TextEditingController locationController,
    ValueNotifier<int> maxParticipants,
  ) async {
    isSubmittingState.value = true;

    await ref.read(communityFormProvider(communityId: community.id).notifier).submit(
          title: titleController.text.trim(),
          content: contentController.text.trim(),
          eventDate: selectedDate.value ?? community.eventDate,
          location: locationController.text.trim(),
          maxParticipants: maxParticipants.value,
          onSuccess: () {
            isSubmittingState.value = false;
            if (context.mounted) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.workoutLogModified)), // TODO: add proper l10n
              );
            }
          },
        );
  }
}
