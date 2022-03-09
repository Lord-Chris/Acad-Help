import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/_core.dart';
import '../_services.dart';

class AuthenticationService implements IAuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _keyValStorageService = locator<IKeyValueStorageService>();

  CollectionReference get _userColl => _firestore.collection("users");

  @override
  Future<void> signUp(UserModel userInfo) async {
    try {
      final _user = await _auth.createUserWithEmailAndPassword(
          email: userInfo.email, password: userInfo.password);
      userInfo = userInfo.copyWith(id: _user.user!.uid);
      await _userColl.doc(userInfo.id).set(userInfo.toMap());
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      final _userCred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final _user = await _userColl.doc(_userCred.user!.uid).get()
          as DocumentSnapshot<Map<String, dynamic>?>;

      await _keyValStorageService.saveMap(
          key: AppKeys.user, value: _user.data()!);
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  @override
  Future<void> updateProfile(String fullName, String dob) async {
    try {
      final data = {
        "name": fullName,
        "dob": dob,
      };
      await _userColl.doc(currentUser!.id).update(data);
      final _user = await _userColl.doc(currentUser!.id).get()
          as DocumentSnapshot<Map<String, dynamic>?>;

      await _keyValStorageService.saveMap(
          key: AppKeys.user, value: _user.data()!);
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  UserModel? get currentUser {
    if (_keyValStorageService.readMap(key: AppKeys.user) == null) return null;
    return UserModel.fromMap(_keyValStorageService.readMap(key: AppKeys.user)!);
  }
}
