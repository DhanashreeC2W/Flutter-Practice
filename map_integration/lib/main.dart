import 'package:flutter/material.dart';
import 'package:map_integration/map_demo.dart';
import 'package:map_integration/map_tracker.dart';
import 'package:map_integration/nearby_location_tracker.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchAndNavigateMap(),
    );
  }
}
