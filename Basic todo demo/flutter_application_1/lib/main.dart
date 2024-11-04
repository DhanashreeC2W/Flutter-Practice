import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_model.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Todoadv(),
    );
  }
}

class Todoadv extends StatefulWidget {
  const Todoadv({super.key});
  @override
  State<Todoadv> createState() => _TodoadvState();
}

class _TodoadvState extends State<Todoadv> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descrController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  List<TodoModel> todoList = [
     TodoModel(
        title: "Complete todo",
        description: "sdfghjkdfghjfghj",
        date: "12.3.2024"),
          TodoModel(
        title: "Complete todo",
        description: "sdfghjkdfghjfghj",
        date: "12.3.2024"),
  ];
  void openBottom(bool isEdit, [TodoModel? obj]) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Create-To-Do",
                style: GoogleFonts.quicksand(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Title",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter Ttile ",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Enter descr",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.quicksand(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ],
              ),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.date_range_outlined),
                  hintText: "Enter date",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(89, 57, 241, 1),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () {
                    submit(isEdit,obj);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: const Color.fromRGBO(89, 57, 241, 1),
                    ),
                    child: Text(
                      "Submit",
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void submit(bool isEdit,[TodoModel? obj]) {
    if (isEdit == false) {
      todoList.add(TodoModel(
          title: titleController.text,
          description: descrController.text,
          date: dateController.text));
    }else{
      obj!.title = titleController.text;
      obj.description = descrController.text;
      obj.date = dateController.text;
    }
    setState(() {
      
    });
    Navigator.of(context).pop();
  }

  Widget card(int index) {
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const StretchMotion(),
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  print(index);
                  titleController.text = todoList[index].title;
                  descrController.text = todoList[index].description;
                  dateController.text = todoList[index].date;

                  openBottom(true,todoList[index]);
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                  child: const Icon(Icons.edit),
                ),
              ),
              GestureDetector(
                onTap: (){
                  todoList.removeAt(index);
                  setState(() {
                    
                  });
                },
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.amber),
                  child: const Icon(Icons.delete),
                ),
              ),
            ],
          )
        ],
      ),
      child: Container(
        height: 140,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.16),
              blurRadius: 15,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                height: 72,
                width: 72,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  shape: BoxShape.circle,
                ),
                // child: Padding(
                //   padding: const EdgeInsets.all(14.0),
                //   child: SvgPicture.asset("assets/gallery.svg"),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///TITLE
                  Text(
                    todoList[index].title,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 350,
                      //DES
                      child: Text(
                        todoList[index].description,
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(0, 0, 0, 0.7)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      todoList[index].date,
                      style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 0.7)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: Text(
              "Good morning",
              style: GoogleFonts.quicksand(
                fontSize: 33,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0, left: 25),
            child: Text(
              "Pathum",
              style: GoogleFonts.quicksand(
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(217, 217, 217, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "CREATE TO DO LIST",
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      child: ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Column(
                              children: [
                                card(index),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openBottom(false);
        },
        backgroundColor: const Color.fromRGBO(89, 57, 241, 1),
        shape: const CircleBorder(eccentricity: 1),
        child: const Icon(
          Icons.add_sharp,
          color: Colors.white,
          size: 50,
        ),
      ),
      backgroundColor: const Color.fromRGBO(111, 81, 255, 1),
    );
  }
}
