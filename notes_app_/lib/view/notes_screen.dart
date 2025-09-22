import 'package:flutter/material.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

openBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Enter Description",
                  border: OutlineInputBorder(),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Upload Images"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Submit Note"),
              ),
            ],
          ),
        );
      });
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 4,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Container(
            height: 200,
            width: 200,
            margin: const EdgeInsets.all(30),
            color: Colors.amber,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openBottomSheet(context);
      }),
    );
  }
}
