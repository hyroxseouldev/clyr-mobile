import 'package:clyr_mobile/src/core/router/router_path.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // button to go to home page using router
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(RoutePaths.home);
          },
          child: Text('Go to Home Page'),
        ),
      ),
    );
  }
}
