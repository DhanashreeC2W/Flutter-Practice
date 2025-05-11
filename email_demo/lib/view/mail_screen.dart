import 'package:flutter/material.dart';

import '../controller/email_function.dart';

class MailScreen extends StatefulWidget {
  const MailScreen({super.key});

  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _msgControlller = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final EmailFunction emailFunction = EmailFunction();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: _mailController,
          ),
          TextField(
            controller: _msgControlller,
          ),
          TextField(
            controller: _subjectController,
          ),
          ElevatedButton(
              onPressed: () async {
                await emailFunction.sendEmail(context, _msgControlller.text,
                    _mailController.text, _subjectController.text);
              },
              child: Text("Send Mail"))
        ],
      ),
    );
  }
}
