import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/firebase_demo.dart';
import 'package:flutter/material.dart';

void main() async {
  /// THE WIDGETSFLUTTERBINDING IS A CLASS THAT PROVIDES THE CONNECTION BETWEEN THE FLUTTER FRAMEWORK AND THE NATIVE PLATFORM.
  /// BY CALLING WIDGETSFLUTTERBINDING.ENSUREINITIALIZED(),
  /// YOU ENSURE THAT THE FLUTTER ENGINE IS PROPERLY INITIALIZED AND READY TO INTERACT WITH THE NATIVE PLATFORM.
  /// THIS ENSURES THAT EVERYTHING IS PROPERLY SET UP FOR THE APP TO START.

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBWSdJu8O6Qg77bSV0D0iON_BRK3BBDEtU",
          appId: "1:55540553373:android:2a3653d22c4e3d1022a674",
          messagingSenderId: "55540553373",
          projectId: "fir-practice-f0b57"));
          runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoFirebase());
  }
}
