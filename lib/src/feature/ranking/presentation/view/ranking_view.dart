import 'package:flutter/material.dart';

class RankingView extends StatelessWidget {
  const RankingView({super.key});
  static const String routeName = 'ranking';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ranking',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: const Center(child: Text('Ranking')),
    );
  }
}
