import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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

const double kWidth = 20.0;

class _RainBowPainter extends CustomPainter {
  final List<Color> colors = const [
    Color(0xFF8B00FF),
    Color(0xFF0000FF),
    Color(0xFF00FFFF),
    Color(0xFF00FF00),
    Color(0xFFFFFF00),
    Color(0xFFFF7F00),
    Color(0xFFFF0000),
  ];

  final Paint _paint = Paint()
    ..strokeWidth = kWidth / 2
    ..style = PaintingStyle.stroke;

  final AnimationController repaint;

  _RainBowPainter({required this.repaint}) : super(repaint: repaint);

  final double widthStep = kWidth;

  void drawRainBow(Canvas canvas) {
    double width = kWidth * 5;
    for (int i = 0; i < colors.length; i++) {
      final color = colors[i];
      Path path = Path();
      path.moveTo(-width, 0.0);
      path.arcTo(
        Rect.fromCenter(center: Offset.zero, width: width, height: width),
        -pi,
        repaint.value,
        true,
      );
      _paint.color = color;
      _paint.maskFilter = const MaskFilter.blur(BlurStyle.solid, 4);
      canvas.drawPath(path, _paint);
      width += widthStep;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawRainBow(canvas);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
