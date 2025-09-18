import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_sqflite_2025/demo/database_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> dataList = [];
  @override
  void initState() {
    super.initState();
    getData();
    
  }

  getData() async {
    dataList = await DatabaseService().getData();
    log("$dataList");
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return 
          Container(
            child: Column(
              children: [
                Text("Name :${dataList[index]["name"]}"),
                Text("Food :${dataList[index]["food"]} "),
                Text("Order ${dataList[index]["id"]}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
