import 'dart:math' as math;

import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 50,
          // constraints:
          //     BoxConstraints(minWidth: 20, maxWidth: 30, maxHeight: 30),
          alignment: Alignment.center,
          // padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
          ),
          transformAlignment: Alignment.center,
          transform: Matrix4.rotationX(math.pi / 3)..rotateZ(-math.pi / 4),
          // clipBehavior: Clip.hardEdge,
          child: Text('data'),
        ),
      ),
    );
  }
}
