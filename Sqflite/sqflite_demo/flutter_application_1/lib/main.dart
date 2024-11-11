import 'package:flutter/material.dart';
import 'package:flutter_application_1/person_details_screen.dart';


void main() {
//  WidgetsFlutterBinding.ensureInitialized();
//   databaseFactory = databaseFactoryFfiWeb;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PersonDetailsScreen(),
    );
  }
}
