import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: UsernameCheckerScreen(),
  ));
}

class UsernameCheckerScreen extends StatefulWidget {
  const UsernameCheckerScreen({super.key});

  @override
  State<UsernameCheckerScreen> createState() => _UsernameCheckerScreenState();
}

class _UsernameCheckerScreenState extends State<UsernameCheckerScreen> {
  final TextEditingController _controller = TextEditingController();
  String _statusMessage = '';

  final List<String> takenUsernames = ["admin", "test", "user123"];

  void _checkAvailability() {
    final username = _controller.text.trim();

    if (username.isEmpty) {
      setState(() {
        _statusMessage = "❗ Please enter a username";
      });
      return;
    }

    if (takenUsernames.contains(username.toLowerCase())) {
      setState(() {
        _statusMessage = "❌ Username not available";
      });
    } else {
      setState(() {
        _statusMessage = "✅ Username available!";
      });
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Username Checker")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// INPUT FIELD
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter Username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            /// CHECK BUTTON
            ElevatedButton(
              onPressed: _checkAvailability,
              child: const Text("Check Availability"),
            ),

            const SizedBox(height: 20),

            /// STATUS TEXT
            Text(
              _statusMessage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _statusMessage.contains("✅") ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
