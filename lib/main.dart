import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:beigam_desktop/controllers/controller.dart';
import 'package:beigam_desktop/screens/dash_board_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Controller(),)
        ],
        child: DashBoardScreen(),
      ),
    );
  }
}

