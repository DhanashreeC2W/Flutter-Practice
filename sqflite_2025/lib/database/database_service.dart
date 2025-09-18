import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_2025/model/zomato_model.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

dynamic database;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
 databaseFactory = databaseFactoryFfiWeb;

  DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDB();
  log("Initialized");
  ZomatoModel obj1 =
      ZomatoModel(userName: "DD", orderNo: 1, food: "Biryani", quantity: 2);
  ZomatoModel obj2 =
      ZomatoModel(userName: "DD", orderNo: 2, food: "Ice cream", quantity: 2);

  await databaseService.insertData(obj1);
  await databaseService.insertData(obj2);

  await databaseService.getData();

  // obj2 =
  //     ZomatoModel(userName: "Monika", orderNo: 2, food: "Panner", quantity: 1);
  // databaseService.updateData(await database, obj2);
  // await databaseService.getData();
}

class DatabaseService {
  Future<void> initializeDB() async {
    log("In Initializing");
    database = openDatabase(
      join(await getDatabasesPath(), "Orders.db"),
      version: 1,
      onCreate: (db, version) {
        log(db.path);
        db.execute("""
          CREATE TABLE Orders1(
            userName TEXT,
            quantity INTEGER,
            food TEXT,
            orderNo INTEGER PRIMARY KEY
          )
        """);
      },
    );
  }

  Future<void> insertData(ZomatoModel obj) async {
    Database localDB = await database;
    int id = await localDB.insert("Orders1", obj.zomatoMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    log("ID is : $id");
  }

  Future<List<Map<String, dynamic>>> getData() async {
    Database locaDB = await database;
    List<Map<String, dynamic>> dataList = await locaDB.query("Orders1");
    log("$dataList");
    return dataList;
  }

  void updateData(Database localDB, ZomatoModel obj) async {
    await localDB.update("Orders1", obj.zomatoMap(),
        where: "orderNo=?", whereArgs: [obj.orderNo]);
  }
}
