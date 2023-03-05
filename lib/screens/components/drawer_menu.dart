import 'package:beigam_desktop/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:beigam_desktop/constants/constants.dart';
import 'package:beigam_desktop/screens/components/drawer_list_tile.dart';
import 'package:provider/provider.dart';

import '../../constants/route_name.dart';
import '../../controllers/controller.dart';

class DrawerMenu extends StatelessWidget {
  final String logoFileName;

  const DrawerMenu({Key? key, required this.logoFileName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            height: 120,
            child: Image.asset("assets/images/$logoFileName.png"),
          ),
          DrawerListTile(
              title: 'Dash Board',
              svgSrc: 'assets/icons/Dashboard.svg',
              tap: () {
                navigatePushReplaceName(dashboard);
                context.read<Controller>().closeMenu();
              }),
          DrawerListTile(
              title: 'Blog Post',
              svgSrc: 'assets/icons/BlogPost.svg',
              tap: () {
                navigatePushReplaceName(welcome);
                context.read<Controller>().closeMenu();
              }),
          DrawerListTile(
              title: 'Message',
              svgSrc: 'assets/icons/Message.svg',
              tap: () {
                navigatePushReplaceName(welcome);
                context.read<Controller>().closeMenu();
              }),
          DrawerListTile(
              title: 'Statistics',
              svgSrc: 'assets/icons/Statistics.svg',
              tap: () {
                navigatePushReplaceName(welcome);
                context.read<Controller>().closeMenu();
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Divider(
              color: grey,
              thickness: 0.2,
            ),
          ),
          DrawerListTile(
              title: 'Settings',
              svgSrc: 'assets/icons/Setting.svg',
              tap: () {}),
          DrawerListTile(
              title: 'Logout', svgSrc: 'assets/icons/Logout.svg', tap: () {}),
        ],
      ),
    );
  }
}
