import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_controller.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<TodoModel> allTasksList = [
    TodoModel(
        todoTitle: "Nature Walk",
        todoDate: "12.02.2024",
        todoDescr:
            "Take a walk in nature or spend time outdoors to clear your mind.")
  ];

  List cardColorsList = [
    const Color.fromARGB(255, 181, 209, 232),
    const Color.fromARGB(255, 200, 178, 239),
    Colors.lightBlue
  ];

  void myBottomSheet(bool isEdit, TodoModel? obj) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  top: 20,
                  left: 20,
                  right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ///TEXTFEILD FOR TITLE
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: "Enter Title",
                        label: Text("Title"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 135, 150, 233))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 67, 3, 67)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///TEXTFEILD FOR DESCRIPTION
                  TextField(
                    controller: descrController,
                    decoration: const InputDecoration(
                        hintText: "Enter Description",
                        label: Text("Description"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 135, 150, 233))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 67, 3, 67)))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ///TEXTFEILD FOR DATE
                  TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                        hintText: "Enter Date",
                        label: Text("Date"),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 135, 150, 233))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 67, 3, 67)))),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isEdit) {
                        obj!.todoTitle = titleController.text;
                        print(obj.todoTitle);
                        obj.todoDate = dateController.text;
                        obj.todoDescr = descrController.text;
                      } else {
                        allTasksList.add(TodoModel(
                            todoTitle: titleController.text,
                            todoDate: dateController.text,
                            todoDescr: descrController.text));
                        titleController.clear();
                        dateController.clear();
                        descrController.clear();
                      }
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      alignment: Alignment.center,
                      color: const Color.fromARGB(255, 154, 223, 216),
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: allTasksList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(15),
            padding: const EdgeInsets.all(10),
            height: 120,
            width: double.infinity,
            color: cardColorsList[index % cardColorsList.length],
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(allTasksList[index].todoTitle!),
                          Text(allTasksList[index].todoDescr!),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(allTasksList[index].todoDate!),
                    const Spacer(),

                    ///EDIT BUTTON
                    GestureDetector(
                        onTap: () {
                          print(allTasksList[index].todoTitle);
                         titleController.text = allTasksList[index].todoTitle!;
                          dateController.text = allTasksList[index].todoDate!;
                           descrController.text = allTasksList[index].todoDescr!;
                          myBottomSheet(
                            true,allTasksList[index]
                          );
                        },
                        child: const Icon(Icons.edit)),

                    ///DELETE BUTTON
                    GestureDetector(
                        onTap: () {
                          print(index);
                          allTasksList.remove(allTasksList[index]);
                          setState(() {});
                        },
                        child: const Icon(Icons.delete))
                  ],
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        TodoModel obj =
            TodoModel(todoTitle: null, todoDate: null, todoDescr: null);
        myBottomSheet(false, obj);
        setState(() {});
      }),
    );
  }
}
