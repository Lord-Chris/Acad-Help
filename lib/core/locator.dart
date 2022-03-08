import 'package:get_it/get_it.dart';

import '../services/_services.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<INavigationService>(() => NavigationService());
  locator.registerLazySingleton<IKeyValueStorageService>(
      () => KeyValueStorageService());
  // locator.registerLazySingleton<IFirestoreService>(() => FirestoreService());
  locator.registerLazySingleton<IAuthenticationService>(
      () => AuthenticationService());
}
