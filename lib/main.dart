import 'package:flutter/material.dart';
import 'package:flutter_twitter/pages/login_page.dart';
import 'package:flutter_twitter/themes/dark_mode.dart';
import 'package:flutter_twitter/themes/light_mode.dart';
import 'package:flutter_twitter/themes/theme_provider.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Remove Debug banner
      home: LoginPage(),

      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
