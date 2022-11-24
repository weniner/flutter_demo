import 'package:flutter/material.dart';

class MarqueeEffect extends StatefulWidget {
  const MarqueeEffect({Key? key}) : super(key: key);

  @override
  State<MarqueeEffect> createState() => _MarqueeEffectState();
}

class _MarqueeEffectState extends State<MarqueeEffect>
    with SingleTickerProviderStateMixin {
  late double width;

  late double height;

  late TextSpan measureText;

  late _TextInfo textInfo;

  late TextPainter _painter;

  late AnimationController _scrollController;

  final double kMargin = 20.0;
  final double kSpeed = 1;

  final String kText = 'Flutter 文字特效之跑马灯';

  @override
  void initState() {
    super.initState();
    measureText =
        TextSpan(text: kText, style: const TextStyle(color: Colors.black));
    _painter = TextPainter(
      text: measureText,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(minWidth: 0.0, maxWidth: double.infinity);
    _scrollController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    width = _painter.width;
    height = _painter.height;
    textInfo = _TextInfo(width, kMargin);
    _scrollController.addListener(_scrollListener);
  }

  @override
  void reassemble() {
    super.reassemble();
    if (_scrollController.isAnimating) _scrollController.stop();
    if (!_scrollController.isAnimating) _scrollController.repeat();
  }

  @override
  void dispose() {
    if (_scrollController.isAnimating) {
      _scrollController.stop();
    }
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      return ClipRect(
        clipBehavior: Clip.hardEdge,
        child: CustomPaint(
          size: Size(constraints.maxWidth, height),
          painter: _RevolvingLanternPainter(_painter, textInfo),
        ),
      );
    });
  }

  double get screenWidth => MediaQuery.of(context).size.width;

  void _scrollListener() {
    textInfo.update(kSpeed);
  }
}

class _TextInfo extends ChangeNotifier {
  double head = 0.0;

  double width;

  double margin;

  _TextInfo(this.width, this.margin);

  void update(double speed) {
    head -= speed;
    if (head < -width - margin) {
      head += width + margin;
    }
    notifyListeners();
  }
}

class _RevolvingLanternPainter extends CustomPainter {
  TextPainter painter;

  _TextInfo textInfo;

  _RevolvingLanternPainter(
    this.painter,
    this.textInfo,
  ) : super(repaint: textInfo);

  @override
  void paint(Canvas canvas, Size size) {
    double x = textInfo.head;
    int i = 0;
    while (x < size.width) {
      ++i;
      painter.paint(canvas, Offset(x, 0.0));
      x += textInfo.width + textInfo.margin;
    }
  }

  @override
  bool shouldRepaint(_RevolvingLanternPainter oldDelegate) {
    return textInfo != oldDelegate.textInfo;
  }
}
