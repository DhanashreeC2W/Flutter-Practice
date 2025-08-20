// lib/app/controllers/todo_controller.dart
import 'package:get/get.dart';

import '../model/todo_model.dart';

class TodoController extends GetxController {
  List todoList = [].obs;

  void addTask(String title, String descr, int date) {
    todoList.add(Todo(title: title, descr: descr, date: date));
  }
}
