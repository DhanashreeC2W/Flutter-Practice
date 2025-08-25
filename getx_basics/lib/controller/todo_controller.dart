// lib/app/controllers/todo_controller.dart
import 'dart:developer';

import 'package:get/get.dart';

import '../model/todo_model.dart';

class TodoController extends GetxController {
  // List<Todo> todoList = <Todo>[Todo(title: "My TOdo", descr: "Please complete all tasks", date: 12-20-2004)].obs;
  List<Todo> todoList = <Todo>[Todo(title: "My TOdo", descr: "Please complete all tasks", date: 12-20-2004)];

  RxInt count = 0.obs;
  var cnt = 0.obs; 
  RxInt count1 = RxInt(0);

  void addTask(String title, String descr, int date) {
    log("$title" "$descr" "$date");
    // log("${todoList[1]}");
    todoList.add(Todo(title: title, descr: descr, date: date));
    update();
  }
}
