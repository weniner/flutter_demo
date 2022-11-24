import 'package:flutter/material.dart';
import 'package:flutter_demo/rainbow/widget/rainbow.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RainBow(),
      ),
    );
  }
}
