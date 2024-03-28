import 'package:flutter/material.dart';
import 'package:user_authentication/screens/welcome_screen.dart';
import 'package:user_authentication/themes/theme_mode.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zippy Wheels',
      home: const WelcomeScreen(),
      theme: lightModeTheme,
      darkTheme: darkModeTheme,

      //themeMode: ThemeMode.system,
    );
  }
}
