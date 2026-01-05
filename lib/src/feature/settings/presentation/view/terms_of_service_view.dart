import 'package:flutter/material.dart';

class TermsOfServiceView extends StatelessWidget {
  const TermsOfServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('약관'),
      ),
      body: const Center(
        child: Text('약관 - 준비 중'),
      ),
    );
  }
}
