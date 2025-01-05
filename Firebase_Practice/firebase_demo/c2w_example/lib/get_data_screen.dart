import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetDataScreen extends StatefulWidget {
  const GetDataScreen({
    super.key,
  });

  @override
  State<GetDataScreen> createState() => _GetDataScreenState();
}

class _GetDataScreenState extends State<GetDataScreen> {
  List studentData = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('Student').get();

    studentData = response.docs;
    setState(() {});
    log("$studentData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: studentData.length,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 224, 210, 166),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name : ${studentData[index]["Name"]}"),
              Text("College : ${studentData[index]["College"]}"),
              Text("Course & Mode : ${studentData[index]["Courses"]}")
            ],
          ),
        ),
      ),
    );
  }
}
