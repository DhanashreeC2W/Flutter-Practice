import 'package:flutter/material.dart';

class TranslatorScreen extends StatelessWidget {
  const TranslatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {},style: ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(200, 200))), child: Text("Marathi")),
            ElevatedButton(onPressed: () {}, child: Text("English")),
            ElevatedButton(onPressed: () {}, child: Text("Hindi"))
          ],
        ),
      ),
    );
  }
}
