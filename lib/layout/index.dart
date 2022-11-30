import 'package:flutter/material.dart';
import 'package:flutter_demo/layout/multi/multi_layout.dart';
import 'package:flutter_demo/layout/single/single_layout.dart';
import 'package:flutter_demo/model/info.dart';
import 'package:flutter_demo/widget/entrance.dart';
import 'package:go_router/go_router.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Entrance(
        all: [
          Info('单组件布局', single),
          Info('多组件布局', multi),
        ],
      ),
    );
  }
}

List<GoRoute> get router {
  return [
    GoRoute(
      path: single,
      builder: (context, state) => const SingleLayout(),
    ),
    GoRoute(
      path: multi,
      builder: (context, state) => const MultiLayout(),
    ),
  ];
}

const String single = '/single';
const String multi = '/multi';
