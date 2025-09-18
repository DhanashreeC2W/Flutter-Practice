import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_sqflite_2025/demo/zomato_model.dart';

class DatabaseService {
  Future<Database> createDB() async {
    Database db = await openDatabase(
      join(await getDatabasesPath(), "orders.db"),
      version: 2,
      onCreate: (db, version) {
        db.execute("""
        create table  orders(
        name TEXT,
        orderNo INT AUTOINCREAMENT,
        food TEXT,
        quantity INT
       
        )""");
      },
    );
    return db;
  }

  Future<void> checkTables() async {
    Database localDB = await createDB();
    List<Map<String, dynamic>> tables = await localDB
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");
    print("Tables in DB: $tables");
  }

  void insertData(ZomatoModel obj) async {
    Database localDB = await createDB();
    int id = await localDB.insert("orders", obj.zomatoMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    log("data inseted suceesfully id is :$id");
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database localDB = await createDB();
    List<Map<String, dynamic>> dataList = await localDB.query("orders");
    return dataList;
  }
}
