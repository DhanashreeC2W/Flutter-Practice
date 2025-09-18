import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:google_fonts/google_fonts.dart";
import "package:todo_sqflite_2025/demo/database_service.dart";

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  DatabaseService databaseService = DatabaseService();
  TextEditingController titleController = TextEditingController();
  TextEditingController desccontroller = TextEditingController();
  TextEditingController dateController = TextEditingController();

  Color whiteClr = const Color.fromRGBO(255, 255, 255, 1);
  Color blackClr = const Color.fromRGBO(0, 0, 0, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 35, bottom: 60),
            child: Column(
              children: [
                Text("Good morining",
                    style: GoogleFonts.quicksand(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: whiteClr)),
                Text("Dhanashree",
                    style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: whiteClr)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "CREATE TO DO LIST",
                    style: GoogleFonts.quicksand(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 40),
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: ListView.builder(
                          //itemCount: cardList.length,
                          itemBuilder: ((context, index) {
                        return Slidable(
                          closeOnScroll: false,
                          endActionPane: ActionPane(
                            extentRatio: 0.2,
                            motion: const DrawerMotion(),
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // editTask(cardList[index]);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              89, 57, 241, 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(Icons.edit,
                                            color: Colors.white, size: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // deleteTask(cardList[index]);
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              89, 57, 241, 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(Icons.delete,
                                            color: Colors.white, size: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                border: Border.all(
                                    color: const Color.fromRGBO(0, 0, 0, 0.05),
                                    width: 0.5),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.13),
                                      offset: Offset(0, 4),
                                      blurRadius: 20)
                                ]),
                            child: Row(
                              children: [
                                Container(
                                  height: 52,
                                  width: 52,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          217, 217, 217, 1),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/7458/7458117.png",
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    width: 23,
                                    height: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        " cardList[index].title",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              const Color.fromRGBO(0, 0, 0, 1),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        " cardList[index].description",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.7),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        " cardList[index].date",
                                        style: GoogleFonts.quicksand(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              0, 0, 0, 0.7),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Checkbox(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    activeColor: Colors.green,
                                    value: true,
                                    onChanged: (val) {})
                              ],
                            ),
                          ),
                        );
                      })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () {
          openBottomSheet();
        },
        label: const Text("Add"),
        icon: const Icon(Icons.add),
        // child: Icon(
        //   Icons.add,
        //   color: whiteClr,
        //   size: 26,
        // ),
      ),
    );
  }

  openBottomSheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Add Task",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Title",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Title"),
                ),
                const Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                TextField(
                  controller: desccontroller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Description"),
                ),
                const Text(
                  "Date",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                TextField(
                  controller: dateController,
                  onTap: () {
                    showDatePicker(
                        context: context,
                        firstDate: DateTime(2004),
                        lastDate: DateTime(2005));
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter Date"),
                ),
                GestureDetector(
                  onTap: () {
                    String name = titleController.text;
                    String descr = desccontroller.text;
                    int date = int.parse(dateController.text);
                    Map data = {"name": name, "descr": descr, "date": date};
                    // databaseService.insertData(data);
                  },
                  child: Container(
                    height: 50,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromRGBO(111, 81, 255, 1),
                    ),
                    child: const Text("Submit"),
                  ),
                )
              ],
            ),
          );
        });
  }

  Widget todoCard() {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.all(2),
      height: 90,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteClr,
        boxShadow: const [
          BoxShadow(offset: Offset(0, 4), blurRadius: 12),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                height: 52,
                width: 52,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.black),
                child: Image.network(
                    "https://cdn.dribbble.com/userupload/23480376/file/original-f61c5b8ae8d55eed8b35269be0f81848.png?resize=1600x1200"),
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello this my todo"),
                  Text("ewqedfvwedscurefjvnruei63ryefhdwiadskjzcfewudj"),
                  Text("20.02.205"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
