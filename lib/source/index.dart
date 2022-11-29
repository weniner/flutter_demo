import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_demo/source/canvas/canvas_demo.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CanvasDemo(),
        ),
      ),
    );
  }
}
