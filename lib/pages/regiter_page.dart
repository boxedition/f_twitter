import 'package:flutter/material.dart';
import 'package:flutter_twitter/services/auth/service.dart';

import '../components/buttons/button.dart';
import '../components/inputs/text_field.dart';
import '../components/loading/circle.dart';

class RegisterPage extends StatefulWidget {
  final void Function() ontap;

  const RegisterPage({super.key, required this.ontap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwConfirmController = TextEditingController();

  void register() async {
    // Show Loading circle
    showLoadingCircle(context);
    // Attempt Login
    try {
      await _auth.registerEmail(emailController.text, pwController.text);

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
                  "Bora lá criar uma continha!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Email input
                MyTextField(
                  controller: nameController,
                  hintText: "Enter Name",
                  hide: false,
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
                const SizedBox(
                  height: 15,
                ),

                //Password input
                MyTextField(
                  controller: pwConfirmController,
                  hintText: "Confirm Password",
                  hide: true,
                ),

                const SizedBox(
                  height: 25,
                ),
                //Sign in Button
                MyButton(
                  text: "Registar",
                  onTap: register,
                ),
                const SizedBox(
                  height: 15,
                ),
                //Already a member Login Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Já és um membro?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: widget.ontap,
                      child: Text(
                        "Entra por aqui!",
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
