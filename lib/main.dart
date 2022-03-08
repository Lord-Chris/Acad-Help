import 'package:acad_help/services/navigation_service/navigation_service.dart';
import 'package:acad_help/ui/views/splash_view/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/_core.dart';
import 'ui/constants/_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setUpLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      onGenerateRoute: Routes.generateRoute,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: ToastMixin.scaffoldkey,
      theme: ThemeData(
        primarySwatch: AppColors.main,
      ),
      home: const SplashView(),
    );
  }
}
