import 'package:stacked/stacked.dart';

import '../../../core/_core.dart';
import '../../../services/_services.dart';

class ProfileViewmodel extends BaseViewModel with ToastMixin {
  final _authenticationService = locator<IAuthenticationService>();

  UserModel get user => _authenticationService.currentUser!;

  Future<void> updateUserDetails(String fullName, String dob) async {
    try {
      setBusy(true);
      await Future.delayed(const Duration(seconds: 1));
      await _authenticationService.updateProfile(fullName, dob);
      showSuccessToast("Profile Updated Successfully");
      setBusy(false);
    } on Failure catch (e) {
      setBusy(false);
      showFailureToast(e.toString());
    }
  }
}
