import 'package:flutter/material.dart';

class AppInfoPage extends StatelessWidget {
  const AppInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('앱정보'),
      ),
      body: const Center(
        child: Text('앱정보 페이지 - 준비 중'),
      ),
    );
  }
}
