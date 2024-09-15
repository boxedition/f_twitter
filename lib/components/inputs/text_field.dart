import 'package:flutter/material.dart';

/***
 * Text Field
 * A box where a input can be inserted
 * ------------------------------------------
 * 
 * To use this widget you need:
 * - Text Controller (To access what the user typed)
 * - Hint Text ("Ajuda" Descritiva)
 * - Hide -> Obscure text (Obscura input)
 */
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool hide;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.hide, //obscureText on TextField
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: hide,
      //Decuração
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}
