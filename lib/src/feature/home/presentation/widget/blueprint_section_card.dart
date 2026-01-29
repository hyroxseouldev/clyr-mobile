import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:clyr_mobile/src/core/enum/blueprint_card_title_localization.dart';
import 'package:clyr_mobile/src/core/enum/enum.dart';
import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:clyr_mobile/src/feature/home/infra/entity/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

/// Blueprint Section Card 위젯 (아코디언)
class BlueprintSectionCard extends StatelessWidget {
  final BlueprintSectionEntity item;
  final int index;
  final bool isCompleted;
  final bool showingCompleteButton;
  final String completedText;
  final String completeWorkoutText;

  const BlueprintSectionCard({
    super.key,
    required this.item,
    required this.index,
    this.isCompleted = false,
    this.showingCompleteButton = false,
    this.completedText = '완료됨',
    this.completeWorkoutText = '운동 완료',
  });

  void _onCompletePressed(BuildContext context) {
    context.goNamed(
      RoutePaths.homeSectionRecordCreate,
      pathParameters: {
        'sectionId': item.sectionId,
        'sectionItemId': item.id,
      },
      queryParameters: {
        if (item.recordType != null)
          'recordType': item.recordType!.value,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // Convert title to enum display name
    final titleEnum = BlueprintCardTitleEnumX.fromString(item.title);
    final displayTitle = titleEnum?.getLocalizedName(l10n) ?? item.title;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: SizedBox(
          width: 40,
          height: 40,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Text(
              '$index',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        title: Text(displayTitle),
        trailing: const Icon(Icons.expand_more),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Html(
              data: item.content,
              style: {
                "body": Style(
                  fontSize: FontSize(14),
                  padding: HtmlPaddings.zero,
                  margin: Margins.zero,
                ),
                "p": Style(margin: Margins.only(bottom: 8)),
                "div": Style(margin: Margins.only(bottom: 8)),
                "ul": Style(margin: Margins.only(bottom: 8, left: 16)),
                "ol": Style(margin: Margins.only(bottom: 8, left: 16)),
                "li": Style(margin: Margins.only(bottom: 4)),
                "strong": Style(fontWeight: FontWeight.bold),
                "b": Style(fontWeight: FontWeight.bold),
                "h1": Style(
                  fontSize: FontSize(24),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
                "h2": Style(
                  fontSize: FontSize(20),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
                "h3": Style(
                  fontSize: FontSize(18),
                  fontWeight: FontWeight.bold,
                  margin: Margins.only(bottom: 8, top: 8),
                ),
              },
            ),
          ),
          if (showingCompleteButton)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: isCompleted
                      ? null
                      : () => _onCompletePressed(context),
                  style: FilledButton.styleFrom(
                    disabledBackgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                  ),
                  child: Text(
                    isCompleted ? completedText : completeWorkoutText,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
