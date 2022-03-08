import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

mixin DatabaseMixins {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  CollectionReference get userColl => firestore.collection("users");
}
