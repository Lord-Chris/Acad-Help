import '../../core/_core.dart';

abstract class IFirestoreService {
  /// [Future]<[void]> Adds user data to the firestore database
  ///
  /// Parameters: [SignupModel] compulsory
  // Future<void> addUser(SignupModel userInfo);

  // /// [Future]<[void]> Updates an existing weight of the logged in user in the
  // ///  firestore database
  // ///
  // /// Parameters: [WeightInput] compulsory
  // Future<void> updateWeight(WeightInput input);

  // /// [Future]<[void]> Deletes an entry in the database to the firestore database
  // /// It gets the referenced entry through the timestamp of the entry
  // ///
  // /// Parameters: [WeightInput] compulsory
  // Future<void> deleteWeight(WeightInput input);
  // Stream<List<WeightInput>> weightStream();
}
