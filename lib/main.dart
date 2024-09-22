import 'package:flutter/material.dart';
import 'package:flutter_twitter/services/auth/login_register.dart';
import 'package:flutter_twitter/themes/theme_provider.dart';
import 'package:provider/provider.dart';

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
      home: const LoginRegister(),

      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
