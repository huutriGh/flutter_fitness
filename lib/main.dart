import 'package:fitness_app/screens/bmi_screen.dart';
import 'package:fitness_app/screens/intro_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.grey),
      routes: {
        '/': (context) => const IntroScreen(),
        '/bmi': (context) => const BmiScreen(),
      },
      //home: const IntroScreen(),
      initialRoute: "/",
    );
  }
}
