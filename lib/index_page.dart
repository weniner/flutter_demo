import 'package:flutter/material.dart';
import 'package:flutter_demo/model/info.dart';
import 'package:flutter_demo/router/router.dart' as router;
import 'package:flutter_demo/widget/entrance.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Entrance(
        all: [
          Info('风车', router.windmill),
          Info('彩虹', router.rainbow),
          Info('文字特效', router.effects),
          Info('源码解析', router.source),
          Info('布局', router.layout),
        ],
      ),
    );
  }
}
