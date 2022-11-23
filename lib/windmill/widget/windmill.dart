import 'dart:math';

import 'package:flutter/material.dart';

///
class Windmill extends CustomPainter {
  final double radians;

  Windmill({required this.radians}) : super();

  final double windBlade = 100;

  final Paint _paint = Paint()
    ..color = Colors.black
    ..strokeWidth = 2.0;

  @override
  void paint(canvas, Size size) {
    drawStick(canvas, size);
    drawWindmill(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void drawStick(Canvas canvas, Size size) {
    _paint.color = Colors.brown;
    double height = size.height * 0.6;
    double width = size.width * 0.1;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset((size.width - width) / 2, size.height - height),
            width: width,
            height: height),
        _paint);
  }

  final List<Color> colors = [
    Colors.greenAccent.shade100,
    Colors.yellowAccent.shade100,
    Colors.blueAccent.shade100,
    Colors.pinkAccent.shade100,
  ];

  void drawWindmill(Canvas canvas, Size size) {
    double height = size.height * 0.2;
    double width = size.width * 0.3;
    double stickWidth = size.width * 0.1;
    Path path = Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width * 2 / 3, height);
    path.lineTo(width, 0);
    path.close();
    canvas.save();
    canvas.translate(size.width / 2 - stickWidth / 2, height / 2);
    double radian = radians;
    for (int i = 0; i < 4; i++) {
      canvas.save();
      _paint.color = colors[i];
      canvas.rotate(radian);
      canvas.drawPath(path, _paint);
      canvas.restore();
      radian += pi / 2;
    }
    canvas.restore();
  }
}
