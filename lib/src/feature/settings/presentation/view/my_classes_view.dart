import 'package:clyr_mobile/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class MyClassesView extends StatelessWidget {
  const MyClassesView({super.key});
  static const String routeName = 'my_classes';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsMyClasses)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.class_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(l10n.myClassesComingSoon),
          ],
        ),
      ),
    );
  }
}
