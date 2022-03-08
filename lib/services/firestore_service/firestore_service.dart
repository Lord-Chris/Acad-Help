import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/_core.dart';
import '../_services.dart';

class FirestoreService implements IFirestoreService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference _getWeightColl() {
    return _userColl.doc(_auth.currentUser?.uid).collection("weights");
  }

//   @override
//   Future<void> updateWeight(WeightInput input) async {
//     await _getWeightColl()
//         .doc("${input.dateTime.microsecondsSinceEpoch}")
//         .update(input.toUpdateMap());
//   }

//   @override
//   Future<void> deleteWeight(WeightInput input) async {
//     await _getWeightColl()
//         .doc("${input.dateTime.microsecondsSinceEpoch}")
//         .delete();
//   }

//   @override
//   Stream<List<WeightInput>> weightStream() {
//     return _getWeightColl().snapshots().transform<List<WeightInput>>(
//       StreamTransformer<QuerySnapshot<Map<String, dynamic>>,
//           List<WeightInput>>.fromHandlers(
//         handleData: (data, sink) {
//           final _weightList = <WeightInput>[];
//           for (var weightInfo in data.docs) {
//             _weightList.add(
//               WeightInput.fromMap(weightInfo.data()),
//             );
//           }
//           sink.add(_weightList.reversed.toList());
//         },
//       ),
//     );
//   }

  CollectionReference get _userColl => _firestore.collection("users");
}
