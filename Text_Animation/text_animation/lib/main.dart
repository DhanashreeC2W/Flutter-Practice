import 'package:flutter/material.dart';
import 'package:text_animation/View/Screens/text_animation_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextAnimation()
    );
  }
}
