import 'package:flutter/material.dart';
import 'package:flutter_twitter/pages/login_page.dart';
import 'package:flutter_twitter/pages/regiter_page.dart';

/// This Widgets detemines wheter shows Login Page or the Register Page
class LoginRegister extends StatefulWidget {
  const LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  bool showLoginPage = true;

  void toggleLoginRegister() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLoginPage
        ? LoginPage(
            ontap: toggleLoginRegister,
          )
        : RegisterPage(
            ontap: toggleLoginRegister,
          );
  }
}
