import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              const Spacer(),
              InkWell(
                
                splashColor: Colors.amber,
                
                onTap: () {
                  print("Card tapped!");
                },
                child: Container(
                  height: 50,
                  width: 70,
                  alignment: Alignment.center,
                 // padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text("Back", style:  TextStyle(color: Colors.white)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
