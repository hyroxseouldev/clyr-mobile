import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsTerms),
      ),
      body: Center(
        child: Text('${l10n.settingsTerms} - ${l10n.comingSoon}'),
      ),
    );
  }
}
