import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/_core.dart';
import 'i_authentication_service.dart';

class AuthenticationService implements IAuthenticationService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _userColl => _firestore.collection("users");

  @override
  Future<void> signUp(SignupModel userInfo) async {
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Failure(message: e.message, stackTrace: e.stackTrace);
    }
  }

  @override
  Future<void> logOut() async {
    await _auth.signOut();
  }

  @override
  User? get currentUser => _auth.currentUser;
}
