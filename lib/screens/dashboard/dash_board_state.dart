import 'package:beigam_desktop/constants/route_name.dart';
import 'package:beigam_desktop/controllers/base_state.dart';
import 'package:beigam_desktop/repositories/user_repository.dart';
import 'package:beigam_desktop/services/getit_service.dart';
import 'package:beigam_desktop/services/navigation_service.dart';

class DashboardState extends BaseState {
  final userRepo = locate<UserRepository>();
  final navigationService = locate<NavigationService>();

  logOut() {
    userRepo.logout();
    navigatePushReplaceName(authPath);
  }
}