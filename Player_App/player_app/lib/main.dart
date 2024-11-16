import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/View/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
//  apikey:currentkey

// appid:mobileSdkid

// messagingSenderId: projectNumber

// projectId:projectId

// google_services.json  parameters
      options: const FirebaseOptions(
          apiKey: "AIzaSyAs6U8orewgAYXFzrg-Z6XzCLYJNEx7wcg",
          appId: "1:754045744:android:96815c8063e18a9ea8eef5",
          messagingSenderId: "754045744",
          projectId: "fir-flutter-fe24f"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
