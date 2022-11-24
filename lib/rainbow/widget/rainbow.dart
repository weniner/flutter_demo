import 'dart:math';

import 'package:flutter/material.dart';

class RainBow extends StatefulWidget {
  const RainBow({Key? key}) : super(key: key);

  @override
  State<RainBow> createState() => _RainBowState();
}

class _RainBowState extends State<RainBow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      upperBound: pi,
      duration: const Duration(seconds: 2),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RainBowPainter(
        repaint: _controller,
      ),
    );
  }
}

class _RainBowPainter extends CustomPainter {
  final List<Color> colors = const [
    Color(0xFFFF0000),
    Color(0xFFFF7F00),
    Color(0xFFFFFF00),
    Color(0xFF00FF00),
    Color(0xFF00FFFF),
    Color(0xFF0000FF),
    Color(0xFF8B00FF),
  ];

  final Paint _paint = Paint()
    ..strokeWidth = 10.0
    ..style = PaintingStyle.stroke;

  final double initialRadius = 10.0;

  final AnimationController repaint;

  _RainBowPainter({required this.repaint}) : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    drawRainBow(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  final double widthStep = 10.0;

  void drawRainBow(Canvas canvas) {
    double width = 50;
    double radius = initialRadius;
    for (var color in colors) {
      Path path = Path();
      path.moveTo(-width, 0.0);
      path.arcTo(
        Rect.fromCenter(center: Offset.zero, width: width, height: width),
        -pi,
        repaint.value,
        true,
      );
      _paint.color = color;
      canvas.drawPath(path, _paint);
      width += widthStep;
      radius += radius;
    }
  }
}
