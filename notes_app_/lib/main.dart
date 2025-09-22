import 'package:flutter/material.dart';
import 'package:notes_app_/view/add_note_screen.dart';
import 'package:notes_app_/view/notes_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NotesScreen(),
    );
  }
}
