import 'package:flutter/cupertino.dart';
import 'package:tickets/app/routes/app_route_paths.dart';

import '../../features/feature_pages.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutePaths.root:
        return CupertinoPageRoute(builder: (_) => const RootPage());
      case AppRoutePaths.filter:
        return CupertinoPageRoute(builder: (_) => const FilterPage());
      default:
        return CupertinoPageRoute(builder: (_) => const RootPage());
    }
  }
}