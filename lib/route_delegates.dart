import 'package:beigam_desktop/constants/route_name.dart';
import 'package:beigam_desktop/repositories/user_repository.dart';
import 'package:beigam_desktop/screens/dashboard/dash_board_screen.dart';
import 'package:beigam_desktop/services/getit_service.dart';
import 'package:beigam_desktop/services/navigation_service.dart';
import 'package:flutter/material.dart';

class UrlHandlerRouterDelegate extends RouterDelegate<String> {
  final userRepository = locate<UserRepository>();
  final navigationService = locate<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return DashBoardScreen(currentPath: navigationService.determineHomePath());
  }

  @override
  void addListener(VoidCallback listener) {}

  @override
  Future<bool> popRoute() async {
    return false;
  }

  @override
  void removeListener(VoidCallback listener) {}

  @override
  Future<void> setNewRoutePath(configuration) async {
    if (userRepository.currentUserUID != null && configuration != authPath) {
      if (!navigationService.pathToCloseNavigationBar.contains(configuration)) {
        navigationService.setNavigationBar = true;
      }
      navigationService.routeNotifier.value = configuration;
      navigatePushReplaceName(configuration);
    } else {
      if (userRepository.currentUserUID == null) {
        navigatePushReplaceName(authPath);
      } else {
        navigatePushReplaceName(dashboard);
      }
    }
  }
}

class UrlHandlerInformationParser extends RouteInformationParser<String> {
  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) async {
    return "${routeInformation.location}";
  }
}