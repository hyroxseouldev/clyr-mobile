import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWidget<T> extends StatelessWidget {
  const AsyncWidget({super.key, required this.data, required this.builder});
  final AsyncData<T> data;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: builder,
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
