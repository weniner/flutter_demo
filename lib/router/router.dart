import 'package:go_router/go_router.dart';
import 'package:flutter_demo/index_page.dart' as index_page;
import 'package:flutter_demo/windmill/index.dart' as windmill_page;
import 'package:flutter_demo/text_effects/index.dart' as effects_page;
import 'package:flutter_demo/rainbow/index.dart' as rainbow_page;
import 'package:flutter_demo/source/index.dart' as source_page;
import 'package:flutter_demo/layout/index.dart' as layout_page;
import 'package:flutter_demo/base/index.dart' as base_page;

const String index = '/';
const String windmill = '/windmill';
const String effects = '/effects';
const String rainbow = '/rainbow';
const String source = '/source';
const String layout = '/layout';
const String base = '/base';

class Router {
  static GoRouter router = GoRouter(routes: [
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
    GoRoute(
      path: layout,
      builder: (context, state) => const layout_page.IndexPage(),
    ),
    GoRoute(
      path: base,
      builder: (context, state) => const base_page.IndexPage(),
    ),
    ...base_page.router,
    ...effects_page.router,
    ...layout_page.router,
  ]);
}
