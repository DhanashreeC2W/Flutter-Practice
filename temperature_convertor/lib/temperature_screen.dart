import 'dart:developer';

import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  ///TEMPERATURE TEXTFIELD CONTROLLER
  final TextEditingController _tempController = TextEditingController();
  double fahrenheitValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///CENTER WIDGET
      body: Center(
        ///COLUMN WITH TEXTFEILD & ELEVATED BUTTON
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 500,
              child: TextField(
                controller: _tempController,
                decoration: const InputDecoration(
                    label: Text("Enter Temperature in Celcius")),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ///PARSING STRING VALUE IN CONTROLLER
                double celciusTemp = double.parse(_tempController.text);
                log("$celciusTemp");

                setState(() {
                  ///USING FORMULA FOR CONVERSION
                  fahrenheitValue = celciusTemp * 9 ~/ 5 + 32;
                });
                _tempController.clear();
              },
              child: const Text("Convert into Fahrenheit"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Fahrenheit value is $fahrenheitValue"),
          ],
        ),
      ),
    );
  }
}
