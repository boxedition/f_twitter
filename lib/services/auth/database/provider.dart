import 'package:flutter/cupertino.dart';
import 'package:flutter_twitter/models/user.dart';
import 'package:flutter_twitter/services/auth/database/service.dart';
import 'package:flutter_twitter/services/auth/service.dart';

/// Databse provide
/// This povider is to separate the firestore data handling and the UI of the app

class DatabaseProvider extends ChangeNotifier {
  final _auth = AuthService();
  final _db = DatabaseService();

  // get user profile by given uid
  Future<UserProfile?> userProfile(String uid) => _db.getUserFromFireBase(uid);

  // Update user bio
  Future<void> updateBio(String bio) => _db.updateUserBiotoFirebase(bio);
}
