import 'package:flutter/material.dart';

class MyQuizApp extends StatefulWidget {
  const MyQuizApp({super.key});

  @override
  State<MyQuizApp> createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
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
  int currentQuestionIndex = 0;
  int currentButtonIndex = -1;
  bool questionsScreen = true;
  int totalScore = 0;
  WidgetStatePropertyAll<Color>? buttonColor(int buttonIndex) {
    if (currentButtonIndex != -1) {
      if (buttonIndex ==
          allQuestionsList[currentQuestionIndex]["correctAnswerIndex"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (buttonIndex == currentButtonIndex) {
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Scaffold isQuestionScreen() {
    if (questionsScreen == true) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (currentButtonIndex == -1) {
              print("In sanckbar");
              //Text("Please Select option first"),
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Please select option to navigate next page")));
            }
            if (currentButtonIndex ==
                allQuestionsList[currentQuestionIndex]["correctAnswerIndex"]) {
              totalScore++;
            }
            if (currentButtonIndex != -1) {
              if (currentQuestionIndex <= allQuestionsList.length - 1) {
                currentQuestionIndex++;
                currentButtonIndex = -1;
              }
            }
            if (currentQuestionIndex > allQuestionsList.length - 1) {
              questionsScreen = false;
            }

            setState(() {});
          },
          child: const Icon(Icons.navigate_next),
        ),
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.blueGrey),
          ),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                  "Question:${currentQuestionIndex + 1}/${allQuestionsList.length}"),
              Text(
                allQuestionsList[currentQuestionIndex]["questions"],
              ),
              ElevatedButton(
                  onPressed: () {
                    if (currentButtonIndex == -1) {
                      currentButtonIndex = 0;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(backgroundColor: buttonColor(0)),
                  child: Text(
                      "A.${allQuestionsList[currentQuestionIndex]["options"][0]}")),
              ElevatedButton(
                  onPressed: () {
                    if (currentButtonIndex == -1) {
                      currentButtonIndex = 1;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(backgroundColor: buttonColor(1)),
                  child: Text(
                      allQuestionsList[currentQuestionIndex]["options"][1])),
              ElevatedButton(
                  onPressed: () {
                    if (currentButtonIndex == -1) {
                      currentButtonIndex = 2;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(backgroundColor: buttonColor(2)),
                  child: Text(
                      allQuestionsList[currentQuestionIndex]["options"][2])),
              ElevatedButton(
                  onPressed: () {
                    if (currentButtonIndex == -1) {
                      currentButtonIndex = 3;
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(backgroundColor: buttonColor(3)),
                  child: Text(
                      allQuestionsList[currentQuestionIndex]["options"][3])),
            ],
          ),
        ),
      );
    }
    return Scaffold(
      body: Column(
        children: [
          Text(
            totalScore <= allQuestionsList.length ~/ 2
                ? "Congrats"
                : "Better luck next time",
          ),
          Text("Score : $totalScore/${allQuestionsList.length}"),
          ElevatedButton(
              onPressed: () {
                //currentButtonIndex = -1;
                currentQuestionIndex = 0;
                questionsScreen = true;
                setState(() {});
              },
              child: const Text("RESET"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
