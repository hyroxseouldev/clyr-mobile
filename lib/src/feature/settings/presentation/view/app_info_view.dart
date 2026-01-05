import 'package:flutter/material.dart';

class AppInfoView extends StatelessWidget {
  const AppInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앱정보'),
      ),
      body: const Center(
        child: Text('앱정보 - 준비 중'),
      ),
    );
  }
}
