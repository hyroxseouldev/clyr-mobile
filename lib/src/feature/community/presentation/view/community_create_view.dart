import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:clyr_mobile/src/feature/community/presentation/provider/community_form_controller.dart';
import 'package:clyr_mobile/src/shared/widgets/async_button.dart';

/// Community create view - form to create new community
class CommunityCreateView extends ConsumerWidget {
  const CommunityCreateView({super.key});
  static const routeName = 'community_create';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _CommunityCreateForm();
  }
}

class _CommunityCreateForm extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formState = ref.watch(communityFormProvider(communityId: null));

    final formKey = useMemoized(() => GlobalKey<FormState>());
    final titleController = useTextEditingController();
    final contentController = useTextEditingController();
    final locationController = useTextEditingController();
    final selectedDate = useState<DateTime?>(null);
    final maxParticipants = useState<int>(30);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.communityCreate),
      ),
      body: Form(
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
                  hintText: 'Community event title', // TODO: l10n
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
                  hintText: 'Describe your community event', // TODO: l10n
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
                onTap: () => _selectDateTime(context, selectedDate),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: l10n.communityEventDate,
                    border: const OutlineInputBorder(),
                  ),
                  child: Text(
                    selectedDate.value != null
                        ? '${selectedDate.value!.year}-${selectedDate.value!.month.toString().padLeft(2, '0')}-${selectedDate.value!.day.toString().padLeft(2, '0')} '
                          '${selectedDate.value!.hour.toString().padLeft(2, '0')}:${selectedDate.value!.minute.toString().padLeft(2, '0')}'
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
                  hintText: 'Event location', // TODO: l10n
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
              Text('${l10n.communityMaxParticipants}: ${maxParticipants.value}'),
              Slider(
                value: maxParticipants.value.toDouble(),
                min: 2,
                max: 100,
                divisions: 98,
                label: '${maxParticipants.value}',
                onChanged: (value) {
                  maxParticipants.value = value.toInt();
                },
              ),
              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                child: AsyncButton(
                  isLoading: formState.isLoading,
                  text: l10n.confirm,
                  onPressed: () => _handleSubmit(
                    context,
                    ref,
                    formKey,
                    titleController,
                    contentController,
                    selectedDate,
                    locationController,
                    maxParticipants,
                  ),
                ),
              ),
            ],
          ),
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
      initialTime: TimeOfDay.now(),
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
    GlobalKey<FormState> formKey,
    TextEditingController titleController,
    TextEditingController contentController,
    ValueNotifier<DateTime?> selectedDate,
    TextEditingController locationController,
    ValueNotifier<int> maxParticipants,
  ) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    if (selectedDate.value == null) {
      return;
    }

    await ref.read(communityFormProvider(communityId: null).notifier).submit(
          title: titleController.text.trim(),
          content: contentController.text.trim(),
          eventDate: selectedDate.value!,
          location: locationController.text.trim(),
          maxParticipants: maxParticipants.value,
          onSuccess: () {
            if (context.mounted) {
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Community created successfully')), // TODO: l10n
              );
            }
          },
        );
  }
}
