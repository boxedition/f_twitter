import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter/models/user.dart';
import 'package:flutter_twitter/services/auth/service.dart';

/// Database service
///
/// This class handles all the data from and to firebase
/// ------------------
///
/// - User Profile
/// - Post Message
/// - Likes
/// - Comments
/// - Account Stuff (report/ block/ del account)
/// - Follow / Unfollow
/// - Search Users

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /// User profile
  /// When a new user register, we create an account and also store their details in the database

  /// Save User info to Firebase
  Future<void> saveUserInfoToFirebase(
      {required String name, required String email}) async {
    String uid = _auth.currentUser!.uid;

    String username = email.split("@")[0];

    UserProfile u = UserProfile(
      uid: uid,
      name: name,
      email: email,
      username: username,
      bio: '',
    );

    // Convert user into a map so that can be stored in firebase
    final userMap = u.toMap();

    // Save user info to firebase
    await _db.collection("Users").doc(uid).set(userMap);
  }

  /// Save User info to Firebase
  Future<UserProfile?> getUserFromFireBase(String uid) async {
    try {
      DocumentSnapshot doc = await _db.collection("Users").doc(uid).get();

      /// Convert doc to user profile
      return UserProfile.fromDocument(doc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Update user bio
  Future<void> updateUserBiotoFirebase(String bio) async {
    String uid = AuthService().getCurrentUid();

    // Attempt to update in firebase
    try {
      await _db.collection("Users").doc(uid).update({'bio': bio});
    } catch (e) {
      print(e);
    }
  }
}
