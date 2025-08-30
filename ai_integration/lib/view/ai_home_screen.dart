
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/ai_controller.dart';


class AIHomeScreen extends StatefulWidget {
  const AIHomeScreen({super.key});

  @override
  State<AIHomeScreen> createState() => _AIHomeScreenState();
}

class _AIHomeScreenState extends State<AIHomeScreen> {
  final AiController _controller = AiController();
  final TextEditingController _inputController = TextEditingController();
  String _result = '';

  Future<void> _getResponse() async {

    String answer = await _controller.fetchAnswer(_inputController.text);
    log(_inputController.text,name: "View");
    setState(() {
      _result = answer;
      log(_result,name: "View");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gemini AI Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(labelText: 'Enter your prompt'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getResponse,
              child: const Text('Ask AI'),
            ),
            const SizedBox(height: 16),
            Text(_result),
          ],
        ),
      ),
    );
  }
}
