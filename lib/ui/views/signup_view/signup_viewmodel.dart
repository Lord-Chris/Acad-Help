import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../services/_services.dart';

class SignupViewmodel extends BaseViewModel with ToastMixin {
  final _navigationService = locator<INavigationService>();
  final _authenticationService = locator<IAuthenticationService>();
  bool showPassword = false;

  Future<void> registerUser(
      String fullName, String dob, String email, String password) async {
    try {
      setBusy(true);
      final _userDetails = SignupModel(
        name: fullName,
        dob: dob,
        email: email,
        password: password,
      );
      await _authenticationService.signUp(_userDetails);
      setBusy(false);
      navigateToLogin();
      showSuccessToast("Congrats! You have signed Up Successfully");
    } on Failure catch (e) {
      setBusy(false);
      showFailureToast(e.toString());
    }
  }

  void navigateToLogin() {
    _navigationService.offNamed(Routes.loginRoute);
  }

  void toggleObscurity() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
