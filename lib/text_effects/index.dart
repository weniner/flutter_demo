import 'package:flutter/material.dart';
import 'package:flutter_demo/model/info.dart';
import 'package:flutter_demo/text_effects/widget/marquee_effect.dart';
import 'package:flutter_demo/text_effects/widget/typewrite_effect.dart';
import 'package:flutter_demo/widget/entrance.dart';
import 'package:go_router/go_router.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Entrance(
        all: [
          Info('走马灯', marquee),
          Info('打字机', typewrite),
        ],
      ),
    );
  }
}

List<GoRoute> get router {
  return [
    GoRoute(
      path: marquee,
      builder: (context, state) => const MarqueeEffect(),
    ),
    GoRoute(
      path: typewrite,
      builder: (context, state) => const TypewriterEffect(),
    ),
  ];
}

const String marquee = '/marquee';
const String typewrite = '/typewrite';
