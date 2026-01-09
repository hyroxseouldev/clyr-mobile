import 'package:flutter/material.dart';

class StatsView extends StatelessWidget {
  const StatsView({super.key});
  static const String routeName = 'stats';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Stats',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: const Center(child: Text('Stats')),
    );
  }
}
