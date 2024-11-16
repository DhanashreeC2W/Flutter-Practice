// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:firebase_demo/Controller/session_data.dart';
import 'package:firebase_demo/View/Screens/login_screen.dart';
import 'package:firebase_demo/View/Screens/player_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    /// DELAYS THE EXECUTION BY 3 SECONDS AND THEN CHECKS SESSION DATA
    Future.delayed(const Duration(seconds: 3), () async {
      /// FETCH SESSION DATA TO CHECK IF THE USER IS LOGGED IN
      await SessionData.getSessionData();
      log("IS LOGIN : ${SessionData.isLogin}");

      /// IF USER IS LOGGED IN, NAVIGATE TO PLAYER SCREEN
      if (SessionData.isLogin!) {
        log("NAVIGATE TO HOME");
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return PlayerScreen(email: SessionData.emailId!);
        }));
      } else {
        /// OTHERWISE, NAVIGATE TO LOGIN SCREEN
        log("NAVIGATE TO LOGIN");
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return const LoginScreen();
        }));
      }
    });

    // UI OF THE SPLASH SCREEN WITH AN IMAGE
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255,255,255,1),
      body: Column(
        children: [
          Image.network(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              //fit: BoxFit.cover,
              "https://static.vecteezy.com/system/resources/thumbnails/038/258/505/small_2x/cricket-player-logo-female-concept-vector.jpg"),
        ],
      ),
    );
  }
}
