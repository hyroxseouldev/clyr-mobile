import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});
  static const String routeName = 'community';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Community',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: const Center(child: Text('Community')),
    );
  }
}
