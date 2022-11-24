import 'package:flutter/material.dart';
import 'windmill/index.dart' as windmill;
import 'text_effects/index.dart' as beads;
import 'rainbow//index.dart' as rainbow;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const windmill.IndexPage(),
      // home: const beads.IndexPage(),
      home: const rainbow.IndexPage(),
    );
  }
}
