import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/feature/program/infra/entity/program_entity.dart';
import 'package:clyr_mobile/src/feature/program/presentation/provider/program_list_controller.dart';
import 'package:clyr_mobile/src/feature/program/presentation/view/program_detail_view.dart';
import 'package:clyr_mobile/src/feature/program/presentation/widget/program_list_card.dart';
import 'package:clyr_mobile/src/feature/program/presentation/widget/program_grid_card.dart';
import 'package:clyr_mobile/src/shared/widgets/async_widget.dart';
import 'package:clyr_mobile/src/shared/widgets/empty_state.dart';

/// Program list view - displays all public programs
class ProgramListView extends HookConsumerWidget {
  const ProgramListView({super.key});
  static const routeName = 'program_list';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final programsState = ref.watch(programListProvider);
    final isGridView = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.programTitle),
        actions: [
          IconButton(
            icon: Icon(isGridView.value ? Icons.view_list : Icons.grid_view),
            onPressed: () => isGridView.value = !isGridView.value,
          ),
        ],
      ),
      body: AsyncWidget<List<ProgramEntity>>(
        data: programsState,
        builder: (programs) {
          if (programs.isEmpty) {
            return EmptyState(
              text: l10n.emptyProgram,
              icon: const Icon(Icons.fitness_center_outlined),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(programListProvider.notifier).refresh(),
            child: isGridView.value
                ? _buildGridView(context, programs, ref)
                : _buildListView(context, programs, ref),
          );
        },
      ),
    );
  }

  Widget _buildListView(
    BuildContext context,
    List<ProgramEntity> programs,
    WidgetRef ref,
  ) {
    return ListView.builder(
      itemCount: programs.length,
      itemBuilder: (context, index) {
        final program = programs[index];
        return ProgramListCard(
          program: program,
          onTap: () => context.goNamed(
            ProgramDetailView.routeName,
            pathParameters: {'id': program.id},
          ),
        );
      },
    );
  }

  Widget _buildGridView(
    BuildContext context,
    List<ProgramEntity> programs,
    WidgetRef ref,
  ) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: programs.length,
      itemBuilder: (context, index) {
        final program = programs[index];
        return ProgramGridCard(
          program: program,
          onTap: () => context.goNamed(
            ProgramDetailView.routeName,
            pathParameters: {'id': program.id},
          ),
        );
      },
    );
  }
}
