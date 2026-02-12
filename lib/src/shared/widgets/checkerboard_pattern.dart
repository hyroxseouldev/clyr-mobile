import 'package:flutter/material.dart';

/// Checkerboard pattern widget for showing transparent image previews
class CheckerboardPattern extends StatelessWidget {
  final Widget child;
  final double squareSize;
  final Color lightColor;
  final Color darkColor;

  const CheckerboardPattern({
    super.key,
    required this.child,
    this.squareSize = 10,
    this.lightColor = const Color(0xFF606060),
    this.darkColor = const Color(0xFF000000),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CheckerboardPainter(
        squareSize: squareSize,
        lightColor: lightColor,
        darkColor: darkColor,
      ),
      child: child,
    );
  }
}

class _CheckerboardPainter extends CustomPainter {
  final double squareSize;
  final Color lightColor;
  final Color darkColor;

  _CheckerboardPainter({
    required this.squareSize,
    required this.lightColor,
    required this.darkColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final squaresX = (size.width / squareSize).ceil();
    final squaresY = (size.height / squareSize).ceil();

    for (int x = 0; x < squaresX; x++) {
      for (int y = 0; y < squaresY; y++) {
        final paint = Paint()
          ..color = (x + y) % 2 == 0 ? lightColor : darkColor;
        canvas.drawRect(
          Rect.fromLTWH(x * squareSize, y * squareSize, squareSize, squareSize),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
