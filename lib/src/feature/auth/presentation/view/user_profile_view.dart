import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/storage/storage.dart';
import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/user_profile_controller.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserProfileView extends HookConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final profileState = ref.watch(userProfileControllerProvider);

    ref.listen(userProfileControllerProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.error.toString())));
      }
    });

    final nicknameController = useTextEditingController();
    final bioController = useTextEditingController();
    final phoneController = useTextEditingController();
    final selectedFitnessLevel = useState<FitnessLevel?>(null);
    final selectedGoals = useState<Set<String>>({});
    final profileImageUrl = useState<String?>(null);

    // 초기 데이터 설정
    useEffect(() {
      profileState.whenData((profile) {
        nicknameController.text = profile.nickname ?? '';
        bioController.text = profile.bio ?? '';
        phoneController.text = profile.phoneNumber ?? '';
        selectedFitnessLevel.value = profile.fitnessLevel;
        selectedGoals.value = profile.fitnessGoals.toSet();
        profileImageUrl.value = profile.profileImageUrl;
      });
      return null;
    }, [profileState]);

    Future<void> saveProfile() async {
      await ref
          .read(userProfileControllerProvider.notifier)
          .updateProfile(
            onSuccess: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.profileSaved)));
            },
            nickname: nicknameController.text.trim().isEmpty
                ? null
                : nicknameController.text.trim(),
            bio: bioController.text.trim().isEmpty
                ? null
                : bioController.text.trim(),
            phoneNumber: phoneController.text.trim().isEmpty
                ? null
                : phoneController.text.trim(),
            profileImageUrl: profileImageUrl.value,
            fitnessGoals: selectedGoals.value.toList(),
            fitnessLevel: selectedFitnessLevel.value,
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profileTitle),
        actions: [
          TextButton(
            onPressed: profileState.isLoading ? null : saveProfile,
            child: profileState.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(l10n.save),
          ),
        ],
      ),
      body: AsyncWidget<UserProfileEntity>(
        data: profileState,
        builder: (profile) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 프로필 이미지
                Center(
                  child: ImageUploadWidget(
                    bucket: StorageBuckets.publicAssets,
                    path: StoragePaths.userProfile(profile.id ?? ''),
                    initialImageUrl: profileImageUrl.value,
                    onImageUrlChanged: (url) {
                      if (url.isEmpty) {
                        profileImageUrl.value = null;
                      } else {
                        profileImageUrl.value = url;
                      }
                    },
                    width: 120,
                    height: 120,
                    isCircle: true,
                    placeholderText: l10n.profileImage,
                  ),
                ),

                const SizedBox(height: 32),

                TextField(
                  controller: nicknameController,
                  decoration: InputDecoration(
                    labelText: l10n.nickname,
                    hintText: l10n.nicknameHint,
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: l10n.bio,
                    hintText: l10n.bioHint,
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: l10n.phone,
                    hintText: l10n.phoneHint,
                    border: const OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),

                Text(l10n.fitnessLevel, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                SegmentedButton<FitnessLevel>(
                  segments: FitnessLevel.values.map((level) {
                    return ButtonSegment(
                      value: level,
                      label: Text(() {
                        switch (level) {
                          case FitnessLevel.beginner:
                            return l10n.fitnessLevelBeginner;
                          case FitnessLevel.intermediate:
                            return l10n.fitnessLevelIntermediate;
                          case FitnessLevel.advanced:
                            return l10n.fitnessLevelAdvanced;
                        }
                      }()),
                    );
                  }).toList(),
                  selected: selectedFitnessLevel.value != null
                      ? {selectedFitnessLevel.value!}
                      : {},
                  emptySelectionAllowed: true,
                  onSelectionChanged: (Set<FitnessLevel> newSelection) {
                    selectedFitnessLevel.value = newSelection.isEmpty
                        ? null
                        : newSelection.first;
                  },
                ),

                const SizedBox(height: 24),

                Text(l10n.fitnessGoals, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    (l10n.goalWeightLoss, '체중감량'),
                    (l10n.goalStrength, '근력증가'),
                    (l10n.goalMuscle, '근육량 증가'),
                    (l10n.goalStamina, '체력증진'),
                    (l10n.goalFlexibility, '유연성'),
                    (l10n.goalStress, '스트레스 해소'),
                  ].map((goal) {
                    final isSelected = selectedGoals.value.contains(goal.$2);
                    return FilterChip(
                      label: Text(goal.$1),
                      selected: isSelected,
                      onSelected: (selected) {
                        if (selected) {
                          selectedGoals.value = {
                            ...selectedGoals.value,
                            goal.$2,
                          };
                        } else {
                          selectedGoals.value = selectedGoals.value
                              .where((g) => g != goal.$2)
                              .toSet();
                        }
                      },
                    );
                  }).toList(),
                ),

                // 에러 메시지
                if (profileState.hasError) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade700,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            profileState.error.toString(),
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
