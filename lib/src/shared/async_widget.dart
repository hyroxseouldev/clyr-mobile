import 'package:clyr_mobile/src/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncWidget<T> extends StatelessWidget {
  const AsyncWidget({
    super.key,
    required this.data,
    required this.builder,
    this.minHeight,
  });
  final AsyncValue<T> data;
  final Widget Function(T data) builder;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final loadingWidget = minHeight == null
        ? const Center(child: Loader())
        : SizedBox(
            height: minHeight,
            child: const Center(child: Loader()),
          );

    return data.when(
      data: (data) => builder(data),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => loadingWidget,
    );
  }
}
