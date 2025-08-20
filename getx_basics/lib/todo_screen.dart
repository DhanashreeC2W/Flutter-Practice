import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:getx_basics/controller/todo_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoController todoController = TodoController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("In TODOScreen Build");
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return myCard();
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openBottonSheet();
      }),
    );
  }

  Widget myCard() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
    );
  }

  openBottonSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (index) {
          return Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: "Enter title",
                    constraints: BoxConstraints.tightFor(width: 300),
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Enter Description",
                    constraints: BoxConstraints.tightFor(width: 300),
                  ),
                ),
                TextFormField(
                  controller: dateController,
                  decoration: const InputDecoration(
                    hintText: "Enter Date",
                    constraints: BoxConstraints.tightFor(width: 300),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    todoController.addTask(title, descr, date)
                  },
                  child: const Text("Submit"),
                ),
              ],
            ),
          );
        });
  }
}
