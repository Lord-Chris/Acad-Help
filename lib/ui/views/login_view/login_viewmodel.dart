import 'package:acad_help/services/navigation_service/i_navigation_service.dart';
import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';

class LoginViewmodel extends BaseViewModel {
  final _navigationService = locator<INavigationService>();

  bool get showPassword => true;

  void navigateToSignup() {
    _navigationService.offNamed(Routes.signupRoute);
  }

  void loginUser(String email, String password) {}
}
