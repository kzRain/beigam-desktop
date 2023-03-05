import 'dart:async';

import 'package:beigam_desktop/route_delegates.dart';
import 'package:beigam_desktop/screens/dashboard/dash_board_state.dart';
import 'package:beigam_desktop/services/getit_service.dart';
import 'package:beigam_desktop/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:beigam_desktop/controllers/controller.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetItService.initializeService();
  runApp(MyApp());
  }, (error, stack) => debugPrint(error.toString()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Beigam Admin Dashboard',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(create: (context) => Controller(),)
    //     ],
    //     child: DashBoardScreen(),
    //   ),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller(),),
        ChangeNotifierProvider(create: (context) => DashboardState()),
      ],
      child: MaterialApp.router(
        theme: AppTheme.theme,
        title: 'Beigam Admin Dashboard',
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.space): const ActivateIntent(),
        },
        debugShowCheckedModeBanner: false,
        routerDelegate: UrlHandlerRouterDelegate(),
        routeInformationParser: UrlHandlerInformationParser(),
      ),
    );
  }
}

