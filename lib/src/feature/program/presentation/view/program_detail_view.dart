import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/presentation/provider/program_detail_controller.dart';
import 'package:clyr_mobile/src/feature/program/presentation/widget/program_detail_header.dart';
import 'package:clyr_mobile/src/feature/program/presentation/widget/coach_profile_chip.dart';
import 'package:clyr_mobile/src/feature/program/presentation/widget/program_curriculum_section.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';
import 'package:flutter_html/flutter_html.dart';

/// Program detail view - shows full program info
class ProgramDetailView extends ConsumerWidget {
  const ProgramDetailView({super.key, required this.programId});
  static const routeName = 'program_detail';
  final String programId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final programState = ref.watch(programDetailProvider(programId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.programTitle)),
      body: AsyncWidget<ProgramEntity?>(
        data: programState,
        builder: (program) {
          if (program == null) {
            return EmptyState(
              text: l10n.programNotFound,
              icon: const Icon(Icons.error_outline),
            );
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProgramDetailHeader(program: program),
                  const SizedBox(height: 16),
                  if (program.coach != null)
                    CoachProfileChip(
                      coach: program.coach!,
                      coachText: l10n.programCoach,
                    ),
                  const SizedBox(height: 16),
                  if (program.description != null)
                    Html(data: program.description!),
                  const SizedBox(height: 16),
                  if (program.curriculum.isNotEmpty)
                    ProgramCurriculumSection(curriculum: program.curriculum),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
