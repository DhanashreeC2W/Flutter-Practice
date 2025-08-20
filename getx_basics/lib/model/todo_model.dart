// lib/app/models/todo_model.dart
class Todo {
  String title;
  String descr;
  int date;
  bool isDone;

  Todo(
      {required this.title,
      this.isDone = false,
      required this.descr,
      required this.date});
}
