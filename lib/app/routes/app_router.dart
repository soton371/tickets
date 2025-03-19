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
  /*static final GoRouter router = GoRouter(
    initialLocation: AppRoutePaths.tickets,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return RootPage(child: child);
        },
        routes: [
          GoRoute(
            path: AppRoutePaths.tickets,
            builder: (context, state) => TicketPage(),
          ),
          GoRoute(
            path: AppRoutePaths.contacts,
            builder: (context, state) => ContactPage(),
          ),
          GoRoute(
            path: AppRoutePaths.profile,
            builder: (context, state) => ProfilePage(),
          ),
        ],
      ),

      //for filter
      GoRoute(
        path: AppRoutePaths.filter,
        builder: (context, state) => FilterPage(),
      ),
    ],
  );*/
}