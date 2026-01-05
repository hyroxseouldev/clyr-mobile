import 'package:flutter/material.dart';

class PurchaseHistoryView extends StatelessWidget {
  const PurchaseHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('구매내역'),
      ),
      body: const Center(
        child: Text('구매내역 - 준비 중'),
      ),
    );
  }
}
