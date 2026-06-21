import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final firestore = FirebaseFirestore.instance;

  Future saveUser({
    required String uid,

    required String name,

    required String email,
  }) async {
    await firestore.collection('users').doc(uid).set({
      'name': name,

      'email': email,

      'instagram': '@yourinstagram',
    });
  }
}
