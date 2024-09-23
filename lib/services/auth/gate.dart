import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_twitter/pages/home_page.dart';
import 'package:flutter_twitter/services/auth/login_register.dart';

/// Auth Gate
/// This is to check if the user is logged in or not
/// -----------
/// if user is logged in -> go to HomePage()
/// if user is NOT logged in -> go to login or register page
class AuthGateService extends StatelessWidget {
  const AuthGateService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            /// user is logged in
            if (snapshot.hasData) {
              return const HomePage();
            }

            // user is NOT logged in
            else {
              return const LoginRegister();
            }
          }),
    );
  }
}
