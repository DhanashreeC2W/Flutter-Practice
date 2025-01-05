import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  Map courseMap = {};
  bool colorChnage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students Info"),
        backgroundColor: const Color.fromARGB(255, 220, 205, 205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///NAME TEXTFEILD
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),
              //COLLEGE NAME TEXTFEILD
              TextField(
                controller: collegeController,
                decoration: const InputDecoration(
                  hintText: "Enter College Name",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),

              const SizedBox(
                height: 15,
              ),

              ///MAP REPRESENTING ALL COURSES
              Text(courseMap.isEmpty
                  ? "Course Names : No Courses Yet "
                  : "Course Names : $courseMap "),
              const SizedBox(
                height: 15,
              ),
              //COURSE NAMES TEXTFEILD
              TextField(
                controller: courseController,
                decoration: const InputDecoration(
                  hintText: "Enter Course",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              ///ROW FOR OFFLINE / ONLINE MODE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      colorChnage = false;
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor: colorChnage == false
                          ? const WidgetStatePropertyAll(Colors.blue)
                          : const WidgetStatePropertyAll(Colors.white),
                    ),
                    child: const Text(
                      "Offline",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      colorChnage = true;
                      setState(() {});
                    },
                    style: ButtonStyle(
                      backgroundColor: colorChnage == true
                          ? const WidgetStatePropertyAll(Colors.blue)
                          : const WidgetStatePropertyAll(Colors.white),
                    ),
                    child: const Text(
                      "Online",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),

              ///SUBMIT COURSE BUTTON
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    String mode = "";
                    if (courseController.text.isNotEmpty) {
                      if (colorChnage) {
                        mode = "Online";
                      } else {
                        mode = "Offline";
                      }
                      courseMap[courseController.text] = mode;
                      courseController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please Enter course"),
                        ),
                      );
                    }
                    setState(() {});
                    log("$courseMap");
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 220, 205, 205),
                    ),
                  ),
                  child: const Text(
                    "Submit Courses",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              ///ROW FOR ADD AND GET DATA BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (courseMap.isNotEmpty) {
                        Map<String, dynamic> data = {
                          "Name": nameController.text.trim(),
                          "College": collegeController.text.trim(),
                          "Courses": courseMap,
                        };
                        if (nameController.text.isNotEmpty &&
                            collegeController.text.isNotEmpty) {
                          FirebaseFirestore.instance
                              .collection("Student")
                              .add(data);
                          nameController.clear();
                          collegeController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Data Added Successfully"),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please Fill All The Feilds"),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please Submit Courses first"),
                          ),
                        );
                      }

                      setState(() {});
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 125, 218, 209),
                      ),
                    ),
                    child: const Text(
                      "Add Data",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("Get Screen");
                    },
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 125, 218, 209),
                      ),
                    ),
                    child: const Text(
                      "Get Data",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
