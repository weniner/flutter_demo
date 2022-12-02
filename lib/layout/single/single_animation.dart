import 'dart:math';

import 'package:flutter/material.dart';

class SingleAnimation extends StatefulWidget {
  const SingleAnimation({Key? key}) : super(key: key);

  @override
  State<SingleAnimation> createState() => _SingleAnimationState();
}

class _SingleAnimationState extends State<SingleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<_DemoInfo> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = controller.drive(_DemoAnimation());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    if (controller.isAnimating) controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.yellow,
          height: 100,
          width: 200,
          child: ClipRect(
            child: CustomSingleChildLayout(
              delegate: _DemoSingleDelegate(animation: animation),
              child: AnimatedBuilder(
                builder: (BuildContext context, Widget? child) {
                  return Transform.scale(
                    scaleX:
                        animation.status == AnimationStatus.forward ? 1 : -1,
                    child: child,
                  );
                },
                animation: animation,
                child: Image.asset(
                  'assets/images/qiuqiu.png',
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DemoInfo {
  double x;
  double y;

  _DemoInfo(this.x, this.y);

  @override
  String toString() {
    return '_DemoInfo{x: $x, y: $y}';
  }
}

class _DemoAnimation extends Animatable<_DemoInfo> {
  @override
  _DemoInfo transform(double t) {
    return _DemoInfo(-25 + 150.0 * t, 30 + 10 * sin(t * 6 * pi));
  }
}

class _DemoSingleDelegate extends SingleChildLayoutDelegate {
  Animation<_DemoInfo> animation;

  _DemoSingleDelegate({required this.animation}) : super(relayout: animation);

  // @override
  // Size getSize(BoxConstraints constraints) {
  //   return const Size(200, 100);
  // }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(Size(100, 100));
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(animation.value.x, animation.value.y);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
