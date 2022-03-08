import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../services/_services.dart';

class LoginViewmodel extends BaseViewModel with ToastMixin {
  final _navigationService = locator<INavigationService>();
  final _authenticationService = locator<IAuthenticationService>();

  bool get showPassword => true;

  void navigateToSignup() {
    _navigationService.offNamed(Routes.signupRoute);
  }

  Future<void> loginUser(String email, String password) async {
    try {
      setBusy(true);
      await _authenticationService.signIn(email, password);
      setBusy(false);
      _navigationService.offNamed(Routes.homeRoute);
    } on Failure catch (e) {
      setBusy(false);
      showFailureToast(e.toString());
    }
  }
}
