// lib/app/controllers/todo_controller.dart
import 'dart:developer';

import 'package:get/get.dart';

import '../model/todo_model.dart';

class TodoController extends GetxController {
  List<Todo> todoList = <Todo>[Todo(title: "My TOdo", descr: "Please complete all tasks", date: 12-20-2004)].obs;

  void addTask(String title, String descr, int date) {
    log("$title" "$descr" "$date");
    todoList.add(Todo(title: title, descr: descr, date: date));
  }
}
