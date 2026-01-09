import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final today = useState<DateTime>(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('오늘의 운동'),
            Text(
              DateFormat('yyyy-MM-dd (E)', 'ko').format(today.value),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),

        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.calendar_month_outlined),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 가로로 스크롤 되는 날짜 선택 위젯
              Text('Current program'),
              // 현재 등록된 프로그램의 이름과 설명이 나오고 클릭하면 바텀시트에 내가 가지고 있는 프로그램 목록이 나옴
              Container(height: 100, width: double.infinity, color: Colors.red),

              // 운동 세션 내용
            ],
          ),
        ),
      ),
    );
  }
}
