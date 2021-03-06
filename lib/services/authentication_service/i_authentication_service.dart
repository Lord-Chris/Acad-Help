import '../../core/_core.dart';

abstract class IAuthenticationService {
  /// [Future]<[void]> Signs up a user
  ///
  /// Parameters: [SignupModel] model containing the user sign up details
  Future<void> signUp(UserModel userDetails);

  /// [Future]<[void]> Signs in a user
  ///
  /// Parameters: `User Email` and `User Password`
  Future<void> signIn(String email, String password);

  /// [Future]<[void]> Updates a user's details
  ///
  /// Parameters: `User Full Name` and `Date of Birth`
  Future<void> updateProfile(String fullName, String dob);

  /// [Future]<[void]> Signs the currently logged in user out of the app
  ///
  /// Parameters: null
  Future<void> logOut();

  // returns the details of the current user
  UserModel? get currentUser;
}
