import 'package:go_router/go_router.dart';
import 'package:flutter_demo/index_page.dart' as index_page;
import 'package:flutter_demo/windmill/index.dart' as windmill_page;
import 'package:flutter_demo/text_effects/index.dart' as effects_page;
import 'package:flutter_demo/rainbow/index.dart' as rainbow_page;
import 'package:flutter_demo/source/index.dart' as source_page;

const String index = '/';
const String windmill = '/windmill';
const String effects = '/effects';
const String rainbow = '/rainbow';
const String source = '/source';

GoRouter get router {
  return GoRouter(
    routes: _router
      ..addAll(
        effects_page.router,
      ),
  );
}

final List<GoRoute> _router = [
  GoRoute(
    path: index,
    builder: (context, state) => const index_page.IndexPage(),
  ),
  GoRoute(
    path: windmill,
    builder: (context, state) => const windmill_page.IndexPage(),
  ),
  GoRoute(
    path: effects,
    builder: (context, state) => const effects_page.IndexPage(),
  ),
  GoRoute(
    path: rainbow,
    builder: (context, state) => const rainbow_page.IndexPage(),
  ),
  GoRoute(
    path: source,
    builder: (context, state) => const source_page.IndexPage(),
  ),
];
