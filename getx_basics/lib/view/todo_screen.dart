import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_basics/controller/todo_controller.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoController todoController = Get.put(TodoController());
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log("In TODOScreen Build");
    // return Obx(() => Scaffold(
    //       body: ListView.builder(
    //           itemCount: todoController.todoList.length,
    //           itemBuilder: (context, index) {
    //             log("in item builder");
    //             return myCard(index);
    //           }),
    //       floatingActionButton: FloatingActionButton(onPressed: () {
    //         openBottonSheet();
    //       }),
    //     ));
    return Scaffold(
        body: GetBuilder<TodoController>(
          init: TodoController(),
          builder: (controller) {
            return ListView.builder(
              itemCount: todoController.todoList.length,
              itemBuilder: (context, index) {
                return myCard(index);
              },
            );
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.toNamed("translator_screen");
              },
              child: const Icon(Icons.translate),
            ),
            FloatingActionButton(
              onPressed: () {
                openBottonSheet();
              },
              child: const Icon(Icons.add),
            )
          ],
        ));
  }

  Widget myCard(int index) {
    log("in myCard : $index");
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      color: Colors.amber,
      child: Column(
        children: [
          Text(todoController.todoList[index].title),
          Text(todoController.todoList[index].descr),
          Text(todoController.todoList[index].date.toString()),
        ],
      ),
    );
  }

  openBottonSheet() {
    return Get.bottomSheet(Container(
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
              String title = titleController.text.trim();
              String descr = descriptionController.text.trim();
              int date = int.parse(dateController.text.trim());
              todoController.addTask(title, descr, date);
              Get.changeTheme(ThemeData.dark());
              Navigator.of(context).pop();
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    ));
  }
}
