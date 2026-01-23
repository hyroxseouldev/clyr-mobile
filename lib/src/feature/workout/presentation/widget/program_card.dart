import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Program 카드 위젯 (워크아웃 카드 내부용)
class ProgramCard extends StatelessWidget {
  final ProgramEntity program;
  final String workoutId;

  const ProgramCard({
    super.key,
    required this.program,
    required this.workoutId,
  });

  factory ProgramCard.fromEntity(ProgramEntity program, String workoutId) {
    return ProgramCard(program: program, workoutId: workoutId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Program 상세 화면으로 이동 (workoutId를 query parameter로 전달)
        context.go('/workout/program/${program.id}?workoutId=$workoutId');
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: program.programImage != null
                  ? Image.network(
                      program.programImage!,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 120,
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.fitness_center,
                            size: 48,
                            color: Colors.grey,
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 120,
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.fitness_center,
                        size: 48,
                        color: Colors.grey,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          program.name,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        if (program.description != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            program.description!,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.grey.shade600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
