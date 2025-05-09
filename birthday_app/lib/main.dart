import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const BirthdayWebApp());
}

class BirthdayWebApp extends StatelessWidget {
  const BirthdayWebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
