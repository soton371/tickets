import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickets/app/routes/app_route_paths.dart';
import 'package:tickets/app/routes/app_router.dart';
import 'package:tickets/app/theme/app_theme.dart';

import '../core/di/service_locator.dart';
import '../features/features_di.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TicketsBloc>(create: (context) => sl<TicketsBloc>()),
        BlocProvider<ContactBloc>(create: (context) => sl<ContactBloc>()),
        BlocProvider<ProfileBloc>(create: (context) => sl<ProfileBloc>()..add(DoFetchProfile())),
      ],
      child: MaterialApp(
        initialRoute: AppRoutePaths.root,
        onGenerateRoute: AppRouter.generateRoute,
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
