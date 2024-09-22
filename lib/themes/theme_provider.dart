import 'package:flutter/material.dart';
import 'package:flutter_twitter/themes/dark_mode.dart';
import 'package:flutter_twitter/themes/light_mode.dart';

/// *
/// This helps the change of theme of the app

class ThemeProvider extends ChangeNotifier {
  //Set default theme to Light
  ThemeData _themeData = lightMode;

  //Getter
  ThemeData get themeData => _themeData;

  //Get Bool of darkmode
  bool get isDarkMode => _themeData == darkMode;

  //Set theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;

    //Update UI
    notifyListeners();
  }

  void toggleTheme() {
    _themeData == lightMode ? themeData = darkMode : themeData = lightMode;
  }
}
