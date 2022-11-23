import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/config.dart';
import 'package:flutter_demo/windmill/widget/windmill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:record/record.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final Record record = Record();

  double radius = 0.0;

  @override
  void initState() {
    super.initState();
    startRecord();
  }

  void startRecord() async {
    bool hasPermission = await record.hasPermission();
    if (hasPermission) {
      await record.start();
      record
        ..onStateChanged().listen((event) {
          logger.v(event.toString());
        })
        ..onAmplitudeChanged(const Duration(milliseconds: 200)).listen((event) {
          double scale = 1 / event.current;
          final r = (scale * 0.1 * 2 * pi).abs();
          radius += r;
          radius = radius > (2 * pi) ? radius - (2 * pi) : radius;
          logger.v(radius.toString());
          if (mounted) {
            setState(() {});
          }
        });
    } else {
      Fluttertoast.showToast(msg: '无录音权限');
    }
  }

  @override
  void dispose() {
    super.dispose();
    stopRecord();
  }

  void stopRecord() async {
    if (await record.isRecording()) record.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 100,
          child: CustomPaint(
            size: const Size(100, 300),
            painter: Windmill(
              radians: radius,
            ),
          ),
        ),
      ),
    );
  }
}
