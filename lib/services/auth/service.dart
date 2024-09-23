import 'package:firebase_auth/firebase_auth.dart';

/// AuthService
///
/// This handles everything to do with authentication in firebase
/// ------------
/// Login
/// Register
/// Logout
/// Delete
class AuthService {
  final _auth = FirebaseAuth.instance;

  // Get current user
  User? getCurrentUser() => _auth.currentUser;

  String getCurrentUid() => _auth.currentUser!.uid;

  // Login
  //Req: email & pw
  Future<UserCredential> loginEmail(String email, password) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Register
  //Req: email & pw
  Future<UserCredential> registerEmail(String email, password) async {
    try {
      UserCredential userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

// Delete Account
}
