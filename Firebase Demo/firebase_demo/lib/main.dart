import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/demo.dart';
// import 'package:firebase_demo/player_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(demoProjectId: "fir-flutter-fe24f");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Demo(),
    );
  }
}
