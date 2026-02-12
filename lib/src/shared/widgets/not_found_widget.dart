import 'package:flutter/material.dart';

class NotFoundWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const NotFoundWidget({
    super.key,
    required this.message,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64),
          const SizedBox(height: 16),
          Text(message, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
