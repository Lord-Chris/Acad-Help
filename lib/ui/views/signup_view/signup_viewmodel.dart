import 'package:acad_help/core/locator.dart';
import 'package:acad_help/core/routes.dart';
import 'package:acad_help/services/navigation_service/i_navigation_service.dart';
import 'package:stacked/stacked.dart';

class SignupViewmodel extends BaseViewModel {
  final _navigationService = locator<INavigationService>();

  bool get showPassword => false;

  void registerUser(String fullName, String email, String password) {}

  void navigateToLogin() {
    _navigationService.offNamed(Routes.loginRoute);
  }
}
