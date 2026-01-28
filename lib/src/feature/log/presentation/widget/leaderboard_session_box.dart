import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class LeaderboardSessionBox extends StatelessWidget {
  final String description;

  const LeaderboardSessionBox({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Html(
          data: description,
          style: {
            "body": Style(
              fontSize: FontSize(14),
              padding: HtmlPaddings.zero,
              margin: Margins.zero,
              textAlign: TextAlign.center,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            "p": Style(margin: Margins.zero),
            "div": Style(margin: Margins.zero),
            "ul": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
            "ol": Style(margin: Margins.zero, padding: HtmlPaddings.zero),
            "li": Style(margin: Margins.zero),
            "strong": Style(fontWeight: FontWeight.bold),
            "b": Style(fontWeight: FontWeight.bold),
            "h1": Style(
              fontSize: FontSize(18),
              fontWeight: FontWeight.bold,
              margin: Margins.zero,
            ),
            "h2": Style(
              fontSize: FontSize(16),
              fontWeight: FontWeight.bold,
              margin: Margins.zero,
            ),
            "h3": Style(
              fontSize: FontSize(14),
              fontWeight: FontWeight.bold,
              margin: Margins.zero,
            ),
            "br": Style(margin: Margins.only(bottom: 4)),
          },
        ),
      ),
    );
  }
}
