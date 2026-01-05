import 'package:clyr_mobile/src/feature/auth/infra/entity/user_profile_entity.dart';
import 'package:clyr_mobile/src/feature/auth/presentation/provider/user_profile_controller.dart';
import 'package:clyr_mobile/src/shared/async_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    // 초기 데이터 설정
    useEffect(() {
      profileState.whenData((profile) {
        nicknameController.text = profile.nickname ?? '';
        bioController.text = profile.bio ?? '';
        phoneController.text = profile.phoneNumber ?? '';
        selectedFitnessLevel.value = profile.fitnessLevel;
        selectedGoals.value = profile.fitnessGoals.toSet();
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
              ).showSnackBar(const SnackBar(content: Text('프로필이 저장되었습니다')));
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
            fitnessGoals: selectedGoals.value.toList(),
            fitnessLevel: selectedFitnessLevel.value,
          );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('프로필 설정'),
        actions: [
          TextButton(
            onPressed: profileState.isLoading ? null : saveProfile,
            child: profileState.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('저장'),
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
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: profile.profileImageUrl != null
                            ? NetworkImage(profile.profileImageUrl!)
                            : null,
                        child: profile.profileImageUrl == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              // TODO: 이미지 업로드 구현
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 닉네임
                TextField(
                  controller: nicknameController,
                  decoration: const InputDecoration(
                    labelText: '닉네임',
                    hintText: '닉네임을 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                // 자기소개
                TextField(
                  controller: bioController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: '자기소개',
                    hintText: '자기소개를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 16),

                // 연락처
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: '연락처',
                    hintText: '연락처를 입력하세요',
                    border: OutlineInputBorder(),
                  ),
                ),

                const SizedBox(height: 24),

                // 운동 수준
                Text('운동 수준', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                SegmentedButton<FitnessLevel>(
                  segments: FitnessLevel.values.map((level) {
                    return ButtonSegment(
                      value: level,
                      label: Text(level.displayName),
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

                // 운동 목표
                Text('운동 목표', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ['체중감량', '근력증가', '근육량 증가', '체력증진', '유연성', '스트레스 해소']
                      .map((goal) {
                        final isSelected = selectedGoals.value.contains(goal);
                        return FilterChip(
                          label: Text(goal),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              selectedGoals.value = {
                                ...selectedGoals.value,
                                goal,
                              };
                            } else {
                              selectedGoals.value = selectedGoals.value
                                  .where((g) => g != goal)
                                  .toSet();
                            }
                          },
                        );
                      })
                      .toList(),
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
