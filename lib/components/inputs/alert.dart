import 'package:flutter/material.dart';

/// Input alert Box
/// This is a alert dialog box that has a textfield where the user can type in.
/// We will use for editing bio, post a new message
/// --------
///
/// To use this widget, you need:
/// - Text controller
/// - Hint text
/// - Function (Callback)
/// - Text for button ("Save")

class InputAlertBox extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final void Function() onPressed;
  final String onPressedText;

  const InputAlertBox({
    super.key,
    required this.textController,
    required this.hintText,
    required this.onPressed,
    required this.onPressedText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      content: TextField(
        controller: textController,
        maxLength: 140,
        maxLines: 3,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.tertiary),
            borderRadius: BorderRadius.circular(12),
          ),

          // onFocus
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(12),
          ),

          // hint
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),

          fillColor: Theme.of(context).colorScheme.secondary,
          filled: true,

          counterStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      actions: [
        // cancel button
        TextButton(
          onPressed: () {
            // Close Box
            Navigator.pop(context);

            // Clear Controller (Clear previous text)
            textController.clear();
          },
          child: const Text("Cancel"),
        ),

        // primary button
        TextButton(
          onPressed: () {
            // Close Box
            Navigator.pop(context);

            //Execute Callback
            onPressed!();

            // Clear Controller (Clear previous text)
            textController.clear();
          },
          child: Text(onPressedText),
        ),
      ],
    );
  }
}
