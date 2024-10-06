import 'package:flutter/material.dart';
import 'package:sdg_spark/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SDG Explorer',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF117554),
        colorScheme: const ColorScheme.light().copyWith(primary: const Color(0xFF117554)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF117554),
        colorScheme: const ColorScheme.light().copyWith(primary: const Color(0xFF117554)),
      ),
      themeMode: ThemeMode.light, 
      home: const WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}