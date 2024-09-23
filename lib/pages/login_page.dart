import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter/components/buttons/button.dart';
import 'package:flutter_twitter/components/inputs/text_field.dart';
import 'package:flutter_twitter/components/loading/circle.dart';
import 'package:flutter_twitter/services/auth/service.dart';

/// *
/// Login page
///
/// On this page a user can log in with:
/// - user
/// - password
/// --------------------------------------
/// Once the user is authenticated will be redirected to home page
///
/// If the user doesn't have and account, they can go to the register page from here.

class LoginPage extends StatefulWidget {
  final void Function() ontap;

  const LoginPage({super.key, required this.ontap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth = AuthService();

  //Text Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  void login() async {
    // Show Loading circle
    showLoadingCircle(context);
    // Attempt Login
    try {
      await _auth.loginEmail(emailController.text, pwController.text);

      // finishs loading
      if (mounted) hideLoadingCircle(context);
    } catch (e) {
      // finishs loading
      if (mounted) hideLoadingCircle(context);
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              //Center Column
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //"Space"
                const SizedBox(
                  height: 50,
                ),

                //Logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 86,
                  color: Theme.of(context).colorScheme.primary,
                ),

                //"Space"
                const SizedBox(
                  height: 50,
                ),

                //Welcome back
                Text(
                  "Welcome back!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Email input
                MyTextField(
                  controller: emailController,
                  hintText: "Enter Email",
                  hide: false,
                ),
                const SizedBox(
                  height: 15,
                ),

                //Password input
                MyTextField(
                  controller: pwController,
                  hintText: "Enter Password",
                  hide: true,
                ),
                //Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Sign in Button
                MyButton(
                  text: "Entrar",
                  onTap: login,
                ),
                const SizedBox(
                  height: 15,
                ),
                //Not a member? Register Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Não é membro?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Adere se quiseres!",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
