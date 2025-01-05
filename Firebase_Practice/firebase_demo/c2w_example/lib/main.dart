import 'package:c2w_example/get_data_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './add_data_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCSAWc70PAbPGf_3sTaK7me4eJYhltDEyg",
          appId: "1:49009236886:android:9884504bda6d5e7cd99bb7",
          messagingSenderId: "49009236886",
          projectId: "student-info-flutter"));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "Get Screen": (context) => const GetDataScreen(),
      },
      home: const AddDataScreen(),
    );
  }
}
