import 'package:flutter/material.dart';

class TodoModel {
   String title;
   String description;
   String date;
   TodoModel(
      {  required this.title,required this.description,required this.date,});

  static const List<Color> cardColorList =  [
    Color.fromRGBO(238, 189, 213, 1),
    Color.fromRGBO(209, 209, 241, 1),
    Color.fromRGBO(150, 150, 234, 1),
    Color.fromRGBO(212, 241, 157, 1),
    Color.fromRGBO(236, 150, 230, 1),
  ];

   
}
 List<TodoModel> allCardsList = [
    TodoModel(date: "31.12.2004", 
    description: "tasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescription", 
    title: "My Task"),
    TodoModel(date: "31.12.2024", 
    description: "tasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescriptiontasksdescription", 
    title: "My Task"),
  ];
  