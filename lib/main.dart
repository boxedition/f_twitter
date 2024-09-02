import 'package:flutter/material.dart';
import 'package:flutter_twitter/themes/light_mode.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      showPerformanceOverlay: false,
      home: HomePage(),
      
      theme: lightMode,
    );
  }
}