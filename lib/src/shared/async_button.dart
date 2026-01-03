import 'package:flutter/material.dart';

class AsyncButton extends StatelessWidget {
  const AsyncButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
  });
  final bool isLoading;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: isLoading ? const CircularProgressIndicator() : Text(text),
    );
  }
}
