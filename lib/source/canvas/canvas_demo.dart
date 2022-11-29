import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CanvasDemo extends StatelessWidget {
  const CanvasDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        size: const Size(100, 100),
        painter: _DemoPainter(),
      ),
    );
  }
}

class _DemoPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 5;

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制线段
    // canvas.drawLine(Offset.zero, Offset(100, 0.0), _paint);

    // 绘制圆
    // canvas.drawCircle(Offset(50.0, 50.0), 50.0, _paint);

    // 绘制椭圆形
    // canvas.drawOval(Rect.fromCenter(center: Offset(50, 50), width: 100, height: 50), _paint);

    // 绘制矩形
    // 从偏移的中心出发，中心即为矩形中心，以长宽绘制矩型
    // Rect.fromCenter(center: center, width: width, height: height);
    // 从原点出发，离原点往右left，往下top单位为矩形左上角，往右right，往下bottom为右下角画矩型
    // Rect.fromLTRB(left, top, right, bottom);
    // 从center为圆心，直径为长宽画矩形。实际上也就是正方形
    // Rect.fromCircle(center: center, radius: radius);
    // 从原点往右left， 往下top为矩形左上角， width、height为长宽绘制
    // Rect.fromLTWH(left, top, width, height);
    // a.b分别为矩形的对角点
    // Rect.fromPoints(a, b);
    // canvas.drawRect(Rect.fromCircle(center: Offset.zero, radius: 100), _paint);
    // 绘制圆角矩形
    // canvas.drawRRect(RRect.fromRectAndRadius(Rect.fromCircle(center: Offset.zero, radius: 100), Radius.circular(20)),_paint);

    // 绘制圆弧
    // _paint.strokeWidth = 5;
    // _paint.style = PaintingStyle.stroke;
    // canvas.drawArc(Rect.fromCircle(center: Offset(50, 50), radius: 50), 0, pi, false, _paint);
    // canvas.drawArc(Rect.fromCircle(center: Offset(50, 50), radius: 50), 0, pi, true, _paint);

    // 根据画笔填充画布
    // canvas.drawPaint(_paint);

    // 绘制三角形
    // Path path = Path();
    // 首先移到原点
    // path.moveTo(0, 0);
    // 然后直线连接到(0,100)
    // path.lineTo(0, 100);
    // 最后再连接到(100,100)
    // path.lineTo(100, 100);
    // 最后连接到原点闭合
    // path.close();
    // canvas.drawPath(path, _paint);

    // 绘制点段
    // List<Offset> points = const [
    //   Offset(0, 0),
    //   Offset(10, 10),
    //   Offset(20, 20),
    //   Offset(30, 30),
    //   Offset(40, 40),
    // ];
    // canvas.drawPoints(PointMode.lines, points, _paint);

    // 绘制文字
    // TextPainter painter = TextPainter(
    //   text: TextSpan(
    //       text: '绘制文字', style: TextStyle(color: Colors.black, fontSize: 20)),
    //   textDirection: TextDirection.ltr,
    // )..layout();
    // painter.paint(canvas, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
