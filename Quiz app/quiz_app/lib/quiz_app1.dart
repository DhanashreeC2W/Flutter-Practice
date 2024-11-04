import 'package:flutter/material.dart';

class MineQuizApp extends StatefulWidget {
  const MineQuizApp({super.key});

  @override
  State<MineQuizApp> createState() => _MineQuizAppState();
}

class _MineQuizAppState extends State<MineQuizApp> {
  List<Map> allQuestionsList = [
    {
      "questions": "who is the founder of microsoft?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswerIndex": 1
    },
    {
      "questions": "who is the founder of Google?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswerIndex": 2
    },
    {
      "questions": "who is the founder of SpaceX?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswerIndex": 3
    },
    {
      "questions": "who is the founder of Apple?",
      "options": ["Steve Jobs", "Bill Gates", "Lary Page", "Elon Musk"],
      "correctAnswerIndex": 0
    },
    {
      "questions": "who is the founder of Meta?",
      "options": ["Steve Jobs", "Bill Gates", "Mark Zukerberg", "Elon Musk"],
      "correctAnswerIndex": 2
    }
  ];
  int index = 0;
  int selectedButton = -1;
  int score = 0;
  Color? buttonColor(int buttonIndex) {
    if (selectedButton != -1) {
      
      if (buttonIndex == allQuestionsList[index]["correctAnswerIndex"]) {
        if(selectedButton==allQuestionsList[index]["correctAnswerIndex"]){
      score++;
      print("My Score : $score");
    }
        return Colors.green;
      }
      if (selectedButton == buttonIndex) {
        return Colors.red;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Question :${index + 1} ${allQuestionsList.length}"),
          Text(allQuestionsList[index]["questions"]),
          ElevatedButton(
              onPressed: () {
                if (selectedButton == -1) {
                  selectedButton = 0;
                }
                setState(() {});
              },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttonColor(0))),
              child: Text(allQuestionsList[index]["options"][0])),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttonColor(1))),
              onPressed: () {
                if (selectedButton == -1) {
                  selectedButton = 1;
                }
                setState(() {});
              },
              child: Text(allQuestionsList[index]["options"][1])),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttonColor(2))),
              onPressed: () {
                if (selectedButton == -1) {
                  selectedButton = 2;
                }
                setState(() {});
              },
              child: Text(allQuestionsList[index]["options"][2])),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(buttonColor(3))),
              onPressed: () {
                if (selectedButton == -1) {
                  selectedButton = 3;
                }
                setState(() {});
                setState(() {});
              },
              child: Text(allQuestionsList[index]["options"][3])),
          FloatingActionButton(
            onPressed: () {
              if (index + 1 < allQuestionsList.length && selectedButton != -1) {
                index++;
              }
              selectedButton = -1;
              setState(() {});
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(onPressed: () {}),
          FloatingActionButton(onPressed: () {}),
        ],
      ),
    );
  }
}
