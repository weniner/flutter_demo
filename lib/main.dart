import 'package:flutter/material.dart' hide Router;
import 'package:flutter_demo/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: Router.router.routerDelegate,
      routeInformationParser: Router.router.routeInformationParser,
    );
  }
}
