import 'package:flutter/material.dart';
import 'package:flutter_demo/base/widget/container_widget.dart';
import 'package:flutter_demo/base/widget/elapse_widget.dart';
import 'package:flutter_demo/model/info.dart';
import 'package:flutter_demo/widget/entrance.dart';
import 'package:go_router/go_router.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Entrance(
        all: [
          Info('container', container),
          Info('elapse', elapse),
        ],
      ),
    );
  }
}

List<GoRoute> get router {
  return [
    GoRoute(
      path: container,
      builder: (context, state) => const ContainerWidget(),
    ),
    GoRoute(
      path: elapse,
      builder: (context, state) => const ElapseWidget(),
    ),
  ];
}

const String container = '/container';
const String elapse = '/elapse';
