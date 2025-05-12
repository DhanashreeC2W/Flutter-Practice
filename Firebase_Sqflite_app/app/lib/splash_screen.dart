import 'package:app/login_scree.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      return Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const LoginScreen();
      }));
    });
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Journal App",
              style:
                  GoogleFonts.cabin(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Image.network(
                fit: BoxFit.cover,
                "https://cdn.prod.website-files.com/62f567603143f0e513fc0143/63eecc720544ba74527f5810_benefits%20of%20journaling.png"),
          ],
        ),
      ),
    );
  }
}
