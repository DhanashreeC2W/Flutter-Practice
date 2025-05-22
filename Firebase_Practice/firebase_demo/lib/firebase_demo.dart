import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DemoFirebase extends StatefulWidget {
  const DemoFirebase({super.key});

  @override
  State<DemoFirebase> createState() => _FirebaseDemoState();
}

class _FirebaseDemoState extends State<DemoFirebase> {
  TextEditingController empNameController = TextEditingController();
  TextEditingController empSalController = TextEditingController();
  List<Map> empList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ///TEXTFEILD 1 : EMPLOYEE NAME
              TextField(
                controller: empNameController,
                decoration: InputDecoration(
                  hintText: "Enter Employee Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              ///TEXTFEILD 1 : EMPLOYEE SALARY
              TextField(
                controller: empSalController,
                decoration: InputDecoration(
                  hintText: "Enter Employee Salary",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              ///ADD DATA BUTTON
              ElevatedButton(
                onPressed: () async {
                  num salaray = num.parse(empSalController.text);
                  log("${salaray.runtimeType}");
                  Map<String, dynamic> data = {
                    "name": empNameController.text.toUpperCase().trim(),
                    "salary": salaray,
                  };
                  await FirebaseFirestore.instance
                      .collection('Employee')
                      .add(data);
                  empNameController.clear();
                  empSalController.clear();
                },
                child: const Text("Add Data"),
              ),

              ///GET DATA BUTTON
              ElevatedButton(
                onPressed: () async {
                  QuerySnapshot response = await FirebaseFirestore.instance
                      .collection('Employee')
                      .get();
                  log("${response.docChanges}");
                  num maxSal = 0;
                  for (var value in response.docs) {
                    num sal = value['salary'];

                    if (maxSal < sal) {
                      maxSal = sal; 
                      empList.clear();
                      empList
                          .add({"name": value['name'], "sal": value["salary"]});
                    }
                  }
                  log("$empList");
                  setState(() {});
                  log("$maxSal");
                },
                child: const Text("Get data"),
              ),

              ///DISLAYING DATA OF HIGHEST SALARY EMPLOYEE
              const Text("Highest Salary Employee =>"),
              Text(empList.isNotEmpty ? empList[0]['name'] : "No data found")
            ],
          ),
        ),
      ),
    );
  }
}
