import 'package:flutter/material.dart';
import 'package:flutter_demo/model/info.dart';
import 'package:go_router/go_router.dart';

class Entrance extends StatelessWidget {
  final List<Info> all;

  const Entrance({Key? key, required this.all}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return ElevatedButton(
          onPressed: () {
            GoRouter.of(context).push(all[index].path);
          },
          child: Text(all[index].description),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemCount: all.length,
    );
  }
}
