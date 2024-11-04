import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:zomato_example/zomato_model.dart';

dynamic database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfiWeb;
  database = openDatabase(
    join(await getDatabasesPath(), "ZomatoDB"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''
      CREATE TABLE FOOD(
        orderNo int PRIMARY KEY,
        custName TEXT,
        hotelName TEXT,
        food TEXT,
        bill REAL
      )
      ''');
    },
  );

  ///INSERT DATA
  ZomatoModel order1 = ZomatoModel(
      custName: "Dhanashree",
      hotelName: "ABC",
      food: "Ice-cream",
      orderNo: 1,
      bill: 80.01);

 order1 = ZomatoModel(custName: "Dhanashree", hotelName: "DD", food: "Manchurian", orderNo:1 , bill: 10+20);
  ZomatoModel order2 = ZomatoModel(
      custName: "Aditi         ",
      hotelName: "DD",
      food: "Biryani",
      orderNo: 2,
      bill: 110.25);
  insertData(order1);
  insertData(order2);
  updateOrderData(order1);
  print(await getorderData());
}

////TO INSERT DATA
void insertData(ZomatoModel obj) async {
  Database localDB = await database;
  localDB.insert(
    "FOOD",
    obj.zomatoMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

///TO RETRIVE DATA 
Future<List<Map>> getorderData() async {
  Database localDB = await database;
  List<Map> orderList = await localDB.query("FOOD");
  return orderList;
}

updateOrderData(ZomatoModel obj)async{
  Database localDB =await database;

 await localDB.update('FOOD',obj.zomatoMap(),where: "orderNo=?",whereArgs: [obj.hotelName,obj.food] );
}
