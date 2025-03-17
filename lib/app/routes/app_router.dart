import 'package:go_router/go_router.dart';
import 'package:tickets/app/routes/app_route_paths.dart';

import '../../features/feature_pages.dart';

class AppRouter{
  static final GoRouter router = GoRouter(
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
  );
}