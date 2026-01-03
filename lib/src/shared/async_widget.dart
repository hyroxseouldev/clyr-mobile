import 'package:clyr_mobile/src/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWidget<T> extends StatelessWidget {
  const AsyncWidget({super.key, required this.data, required this.builder});
  final AsyncValue<T> data;
  final Widget Function(T data) builder;

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (data) => builder(data),
      error: (error, stackTrace) => Text(error.toString()),
      // center 로 보이게
      loading: () => const Center(child: Loader()),
    );
  }
}
