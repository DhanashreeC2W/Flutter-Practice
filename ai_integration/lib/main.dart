import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/ai_home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AIHomeScreen(),
    );
  }
}
