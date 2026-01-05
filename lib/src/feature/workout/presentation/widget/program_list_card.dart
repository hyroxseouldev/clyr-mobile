import 'package:clyr_mobile/src/feature/workout/infra/entity/workout_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Program 리스트 카드 위젯 (WorkoutView 세로 리스트용)
class ProgramListCard extends StatelessWidget {
  final ProgramEntity program;

  const ProgramListCard({super.key, required this.program});

  factory ProgramListCard.fromEntity(ProgramEntity program) {
    return ProgramListCard(program: program);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Program 상세 화면으로 이동 (workoutId 없이)
        context.go('/workout/program/${program.id}');
      },
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 썸네일
            program.thumbnailUrl != null
                ? Image.network(
                    program.thumbnailUrl!,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey.shade300,
                        child: const Icon(
                          Icons.fitness_center,
                          size: 64,
                          color: Colors.grey,
                        ),
                      );
                    },
                  )
                : Container(
                    height: 200,
                    color: Colors.grey.shade300,
                    child: const Icon(
                      Icons.fitness_center,
                      size: 64,
                      color: Colors.grey,
                    ),
                  ),
            // 프로그램 정보
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    program.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (program.shortDescription != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      program.description!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      FilledButton.tonal(
                        onPressed: () {
                          context.go('/workout/program/${program.id}');
                        },
                        child: const Text('상세보기'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
