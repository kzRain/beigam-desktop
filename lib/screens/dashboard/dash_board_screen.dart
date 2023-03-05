import 'package:flutter/material.dart';
import 'package:beigam_desktop/constants/constants.dart';
import 'package:beigam_desktop/constants/responsive.dart';
import 'package:beigam_desktop/controllers/controller.dart';
import 'package:beigam_desktop/screens/components/drawer_menu.dart';
import 'package:provider/provider.dart';

import '../../services/navigation_service.dart';
import '../components/custom_appbar.dart';
import 'dash_board_state.dart';

class DashBoardScreen extends StatelessWidget {
  final String currentPath;

  const DashBoardScreen({Key? key, required this.currentPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<DashboardState>();
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(logoFileName: "logo"),
      key: context.read<Controller>().scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: DrawerMenu(logoFileName: "logowithtext"),
              ),
            Expanded(
              flex: 5,
              // child: DashboardContent(),
              child: ClipRRect(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    //Header Container
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: CustomAppbar(),
                    ),

                    //Body Container
                    Expanded(
                      child: SafeArea(
                        child: Navigator(
                          key: state.navigationService.navigatorKey,
                          observers: [RouteObservers()],
                          initialRoute: currentPath,
                          onGenerateRoute:
                              state.navigationService.onGeneratedRoute,
                        ),
                      ),
                    ),

                    //Footer Container
                    //Here you will get unexpected behaviour when keyboard pops-up.
                    //So its better to use `bottomNavigationBar` to avoid this.
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text("Footer"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
