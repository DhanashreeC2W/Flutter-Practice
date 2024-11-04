import 'package:advance_todo/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class MyToDo extends StatefulWidget {
  const MyToDo({super.key});
  @override
  State createState() => _MyToDoState();
}

class _MyToDoState extends State {
  TextEditingController titleContoller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void openBottomSheet(bool isEdit, [int? index]) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Add TODO"),
                TextField(
                  controller: titleContoller,
                  decoration: const InputDecoration(
                    hintText: "Enter title",
                  ),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: "Enter Description",
                  ),
                ),
                TextField(
                  onTap: () async {
                    DateTime? todoDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025));

                    String dateFormat = DateFormat.yMMMd().format(todoDate!);
                    dateController.text = dateFormat;
                    setState(() {});
                  },
                  controller: dateController,
                  decoration: const InputDecoration(
                    hintText: "Enter Date",
                  ),
                ),

                ///SUBMIT BUTTON
                GestureDetector(
                  onTap: () {
                    if (isEdit) {
                      allCardsList[index!].title = titleContoller.text;
                      allCardsList[index].description =
                          descriptionController.text;
                      allCardsList[index].date = dateController.text;
                      clearTextFeilds();
                    } else {
                      if (titleContoller.text.trim().isNotEmpty &&
                          dateController.text.trim().isNotEmpty &&
                          descriptionController.text.trim().isNotEmpty) {
                        allCardsList.add(TodoModel(
                            title: titleContoller.text,
                            description: descriptionController.text,
                            date: dateController.text));
                        clearTextFeilds();
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Color.fromARGB(255, 240, 142, 232), content: Text("Non empty data")));
                      }
                    }

                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 226, 147, 240),
                    child: const Text("SUBMIT"),
                  ),
                )
              ],
            ),
          );
        });
  }

  void clearTextFeilds() {
    titleContoller.clear();
    dateController.clear();
    descriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 80, 241),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 90,
              width: 167,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Good Morning,Dhanashree",
                style: TextStyle(color: Colors.white, fontSize: 22),
              )),

          ///GREY CONTAINER
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 120, 118, 118),
                borderRadius: BorderRadius.circular(20),
              ),

              ///COLUMN FOR TEXT AND CONTAINER
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///TEXT
                  const Text(
                    "CREATE TODO",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),

                  ///WHITE CONTAINER
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 233, 238, 248),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: ListView.builder(

                          ///ITEM COUNT
                          itemCount: allCardsList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ///SLIDABLE FOR EDIT , DELETE OPTIONS
                            return Slidable(
                                endActionPane: ActionPane(
                                    extentRatio: 0.2,
                                    motion: const ScrollMotion(),
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ///EDIT ICON
                                          GestureDetector(
                                            onTap: () {
                                              titleContoller.text =
                                                  allCardsList[index].title;
                                              descriptionController.text =
                                                  allCardsList[index]
                                                      .description;
                                              dateController.text =
                                                  allCardsList[index].date;
                                              openBottomSheet(true, index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              margin: const EdgeInsets.all(15),
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 43, 112, 231),
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.edit,
                                              ),
                                            ),
                                          ),

                                          ///DELETE ICON
                                          GestureDetector(
                                            onTap: () {
                                              allCardsList.removeAt(index);
                                              setState(() {});
                                            },
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: const BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 43, 112, 231),
                                                  shape: BoxShape.circle),
                                              child: const Icon(
                                                Icons.delete,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ]),

                                ///TO DO CARDS
                                child: Container(
                                  height: 120,
                                  width: 600,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                          offset: Offset(0, 5),
                                          spreadRadius: 1,
                                          color: Color.fromARGB(
                                              255, 235, 228, 228)),
                                    ],
                                    color: TodoModel.cardColorList[index],
                                  ),
                                  child: Row(
                                    children: [
                                      ///IMAGE
                                      Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.network(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgCiMCMpMXQ6-sDbu_AbsbnZjtudUOUcobEA&s"),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),

                                      ///COLUMN FOR TITLE,DESCRIPTION AND DATE
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ///TO DO TITLE
                                            Text(
                                              allCardsList[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w800),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                ///DESCRIPTION
                                                child: Text(
                                                  allCardsList[index]
                                                      .description,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),

                                            ///DATE
                                            Text(
                                              allCardsList[index].date,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ));
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        openBottomSheet(false);
      }),
    );
  }
}