import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/view/todo_screen.dart';
import 'package:getx_basics/view/translator_screen.dart';

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
    return GetMaterialApp(getPages: [
      GetPage(name: "/translator_screen", page: () => const TranslatorScreen(),),
    ], home: const TodoScreen());
  }
}
