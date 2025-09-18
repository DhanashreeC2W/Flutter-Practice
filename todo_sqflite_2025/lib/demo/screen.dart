import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:todo_sqflite_2025/demo/database_service.dart';
import 'package:todo_sqflite_2025/demo/history_screen.dart';
import 'package:todo_sqflite_2025/demo/zomato_model.dart';

void main() {
  runApp(const MyApp());
  databaseFactory = databaseFactoryFfiWeb;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ZomatoScreen(),
    );
  }
}

class ZomatoScreen extends StatefulWidget {
  const ZomatoScreen({super.key});

  @override
  State<ZomatoScreen> createState() => _ZomatoScreenState();
}

class _ZomatoScreenState extends State<ZomatoScreen> {
  @override
  void initState() {
    super.initState();
    // databaseService.createDB();
  }

  DatabaseService databaseService = DatabaseService();
  TextEditingController nameCntr = TextEditingController();
  TextEditingController foodCntr = TextEditingController();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameCntr,
            ),
            TextField(
              controller: foodCntr,
            ),
            Text("$quantity"),
            IconButton(
                onPressed: () {
                  quantity++;
                  setState(() {});
                },
                icon: Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  ZomatoModel obj = ZomatoModel(
                      userName: nameCntr.text,
                      orderNo: null,
                      food: foodCntr.text,
                      quantity: quantity);
                  databaseService.insertData(obj);
                },
                child: const Text("Submit Order")),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>const HistoryScreen(),
                  ));
                  DatabaseService().checkTables();
                },
                child: const Text("Show Orders"))
          ],
        ),
      ),
    );
  }
}
