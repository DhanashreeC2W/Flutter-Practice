import 'package:flutter/material.dart';
import 'confetti_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const ConfettiAnimationWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "🎉 Happy Birthday Shashi Sir 🤗🎂",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 550,
                  child: Text(
                    "May Lord Krishna shower you with boundless blessings, filling your life with joy, good health, and success. May His divine grace always guide your path and grant you the strength and wisdom to continue inspiring and transforming countless lives.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset(
                  "assets/shashi_sir.png",
                  height: 150,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
