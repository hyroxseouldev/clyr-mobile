import 'package:flutter/material.dart';

class LogView extends StatelessWidget {
  const LogView({super.key});
  static const String routeName = 'log';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Log',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      body: const Center(child: Text('Log')),
    );
  }
}
