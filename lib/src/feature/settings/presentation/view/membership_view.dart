import 'package:flutter/material.dart';

class MembershipView extends StatelessWidget {
  const MembershipView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('멤버쉽 조회'),
      ),
      body: const Center(
        child: Text('멤버쉽 조회 - 준비 중'),
      ),
    );
  }
}
