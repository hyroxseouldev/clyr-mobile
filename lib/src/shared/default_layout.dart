import 'package:clyr_mobile/flavors.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clyr')),
      body: child,
    );
  }
}

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Banner(
      location: BannerLocation.topStart,
      message: F.name,
      color: Colors.green.withAlpha(150),
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 12.0,
        letterSpacing: 1.0,
      ),
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
}
