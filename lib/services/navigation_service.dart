import 'package:beigam_desktop/screens/components/dashboard_content.dart';
import 'package:beigam_desktop/screens/dashboard/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:beigam_desktop/constants/route_name.dart';
import 'package:beigam_desktop/repositories/user_repository.dart';
import 'package:beigam_desktop/screens/authentication/authentication_view.dart';
import '../screens/dashboard/pages/overview/overview_page.dart';
import 'getit_service.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  UserRepository userRepo = locate<UserRepository>();

  ValueNotifier<String> routeNotifier = ValueNotifier<String>(authPath);

  ValueNotifier<bool> showNavigationBar = ValueNotifier<bool>(false);

  List<String> pathToCloseNavigationBar = [
    authPath,
  ];

  set setNavigationBar(bool value) {
    showNavigationBar.value = value;
    showNavigationBar.notifyListeners();
  }

  String determineHomePath() {
    if (userRepo.currentUserUID != null) {
      return dashboard;
    }
    return authPath;
  }

  Route? onGeneratedRoute(RouteSettings settings) {
    // html.window.history.pushState(null, 'foda', "#${settings.name}");

    switch (settings.name) {
      case authPath:
        return navigateToPageRoute(settings, const AuthenticationView());
      case dashboard:
        return navigateToPageRoute(settings, const DashboardContent());
      case welcome:
        return navigateToPageRoute(settings, const OverviewPage(title: "Welcome"));
      default:
        return navigateToPageRoute(settings, const OverviewPage(title: "Overview"));
    }
    return null;
  }

  PageRoute navigateToPageRoute(RouteSettings settings, Widget page,
      {bool maintainState = true, bool fullscreenDialog = false}) {
    return PageRouteBuilder(
      pageBuilder: (c, a1, a2) => page,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
      settings: settings,
      transitionsBuilder: (c, anim, a2, child) =>
          FadeTransition(opacity: anim, child: child),
      transitionDuration: const Duration(milliseconds: 200),
    );
  }

  void navigatePushReplaceName(String path) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(path, (route) => false);
  }
}

class RouteObservers extends RouteObserver<PageRoute<dynamic>> {
  final navigationService = locate<NavigationService>();

  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    if (previousRoute is PageRoute && route is PageRoute) {
      final settings = previousRoute.settings;
      if (settings.name != '/') {
        final routeList = settings.name?.split("?").toList();
        String routePath = routeList?[0] ?? authPath;
        navigationService.routeNotifier.value = routePath;

        final containPreviousRoutePath = navigationService
            .pathToCloseNavigationBar
            .contains(previousRoute.settings.name);

        if (containPreviousRoutePath) {
          navigationService.setNavigationBar = false;
        }

        if (!containPreviousRoutePath) {
          navigationService.setNavigationBar = true;
        }
      }
    }
    super.didPop(route!, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    if (previousRoute is PageRoute && route is PageRoute) {
      final settings = route.settings;

      if (settings.name != '/') {
        final routeList = settings.name?.split("?").toList();
        String routePath = routeList?[0] ?? authPath;
        navigationService.routeNotifier.value = routePath;

        final paths = navigationService.pathToCloseNavigationBar;
        final containRoutePath = paths.contains(route.settings.name);

        if (containRoutePath) {
          navigationService.setNavigationBar = false;
        } else {
          navigationService.setNavigationBar = true;
        }
      }
    }
    super.didPush(route, previousRoute);
  }
}

void navigatePushReplaceName(String path) {
  locate<NavigationService>().navigatePushReplaceName(path);
}
