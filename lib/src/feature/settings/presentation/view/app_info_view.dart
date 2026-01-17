import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settingsAppInfo),
      ),
      body: Center(
        child: Text('${l10n.settingsAppInfo} - ${l10n.comingSoon}'),
      ),
    );
  }
}
