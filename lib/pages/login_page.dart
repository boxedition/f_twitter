import 'package:flutter/material.dart';
import 'package:flutter_twitter/components/buttons/button.dart';
import 'package:flutter_twitter/components/inputs/text_field.dart';

/***
 * Login page
 * 
 * On this page a user can log in with:
 * - user
 * - password
 * --------------------------------------
 * Once the user is authenticated will be redirected to home page
 * 
 * If the user doesn't have and account, they can go to the register page from here.
 */

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Text Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
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
                  onTap: () {
                    print("Estou a tentar entrar...");
                  },
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
                      onTap: () {
                        print("Aderir?");
                      },
                      child: Text(
                        "Adere se quiseres!",
                        style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
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
