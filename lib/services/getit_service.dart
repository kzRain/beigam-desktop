import 'package:get_it/get_it.dart';

import 'package:beigam_desktop/repositories/user_repository.dart';

import 'navigation_service.dart';

class GetItService {
  static final getIt = GetIt.instance;
  static initializeService() {
    getIt.registerSingleton<UserRepository>(UserRepository());
    getIt.registerSingleton<NavigationService>(NavigationService());
    // getIt.registerSingleton<FoodRepository>(FoodRepository());
    // getIt.registerSingleton<ImagePickerService>(ImagePickerService());
  }
}

T locate<T extends Object>() {
  return GetItService.getIt<T>();
}