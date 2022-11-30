import 'package:flutter/material.dart';

class SingleLayout extends StatefulWidget {
  const SingleLayout({Key? key}) : super(key: key);

  @override
  State<SingleLayout> createState() => _SingleLayoutState();
}

class _SingleLayoutState extends State<SingleLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomSingleChildLayout(
          delegate: _DemoSingleDelegate(),
          child: const SizedBox(
            height: 100,
            width: 100,
            child: ColoredBox(color: Colors.cyan),
          ),
        ),
      ),
    );
  }
}

class _DemoSingleDelegate extends SingleChildLayoutDelegate {
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints(maxWidth: 50, maxHeight: 50);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(100, 100);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(25, 25);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
