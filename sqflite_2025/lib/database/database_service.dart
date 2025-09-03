import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_2025/model/zomato_model.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

dynamic database;

void main() async {
  databaseFactory = databaseFactoryFfiWeb;

  DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDB();
  log("Initialized");
}

class DatabaseService {
  Future<void> initializeDB() async {
    log("In Initializing");
    database = openDatabase(
      "C:/Users/DHANASHREE",
      version: 1,
      onCreate: (db, version) {
        log(db.path);
        db.execute("""
          CREATE TABLE Zomato(
            userName TEXT,
            quatity INTEGER,
            food TEXT,
            orderNo INTEGER PRIMARY KEY
          )
        """);
      },
    );
  }

  void insertData(ZomatoModel obj) async {
    Database localDB = await database;
    localDB.insert("Zomato", obj.zomatoMap());
  }
}
