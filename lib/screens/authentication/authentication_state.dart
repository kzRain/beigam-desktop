import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:beigam_desktop/constants/route_name.dart';
import 'package:beigam_desktop/repositories/user_repository.dart';
import 'package:beigam_desktop/services/getit_service.dart';
import 'package:beigam_desktop/services/navigation_service.dart';
import 'package:beigam_desktop/controllers/base_state.dart';

class AuthenticationState extends BaseState {
  final userRepository = locate<UserRepository>();
  final navigationService = locate<NavigationService>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  AuthenticationState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    emailController.addListener(notifier);
    passwordController.addListener(notifier);
  }

  bool get emailIsValid => emailController.text.trim().isNotEmpty && emailController.text.trim().contains("@");

  @override
  void dispose() {
    emailController.removeListener(notifier);
    passwordController.removeListener(notifier);
    super.dispose();
  }

  void notifier() {
    notifyListeners();
  }

  void login() async {
    if (isLoading == false) {
      setLoading(true);
      final login = await userRepository.login(emailController.text.trim(), passwordController.text.trim());
      if (login.isRight) {
        emailController.clear();
        passwordController.clear();

        navigatePushReplaceName(dashboard);
      } else {
        showDialog(
          context: navigationService.navigatorKey.currentContext!,
          builder: (_) => CupertinoAlertDialog(
            title: const Text("An error occurred"),
            content: Text(login.left.message),
          ),
        );
      }
      setLoading(false);
    }
  }
}
