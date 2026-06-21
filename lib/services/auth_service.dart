import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,

      password: password,
    );
  }

  Future login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,

      password: password,
    );
  }

  Future forgotPassword(String email) async {
    return await _auth.sendPasswordResetEmail(email: email);
  }

  Future logout() async {
    return await _auth.signOut();
  }
}
