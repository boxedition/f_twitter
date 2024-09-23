import 'package:flutter/material.dart';
/**
 * Loading Circle
 */

/// Show loading Circle
void showLoadingCircle(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => const AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Center(
              child: CircularProgressIndicator(),
            ),
          ));
}

/// hides loading circle
void hideLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}
