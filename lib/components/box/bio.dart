import 'package:flutter/material.dart';

/// User Bio Box
/// This is a simple box with text inside.
/// ----------
/// To use this widget:
/// - Text

class BioBox extends StatelessWidget {
  final String text;

  const BioBox({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(25),
      child: Text(
        text.isNotEmpty ? text : "Em termos de bio, não há bio :/",
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
