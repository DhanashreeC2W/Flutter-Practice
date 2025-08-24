import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx_basics/todo_screen.dart';

void main() {
  print("In main");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    log(
      "In main build",
      name: "BUILD",
      time: DateTime(DateTime.december),
    );
    return const MaterialApp(home: TodoScreen());
  }
}
