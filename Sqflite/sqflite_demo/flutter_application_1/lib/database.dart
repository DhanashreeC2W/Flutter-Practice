import 'dart:developer';

import 'package:flutter_application_1/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic dataBase;

void createTable() async {
  dataBase = await openDatabase(join(await getDatabasesPath(), "data0601.db"),
      version: 1, onCreate: (db, version)async {
  await  db.execute('''
            CREATE TABLE Details(
  personId INTEGER PRIMARY KEY AUTOINCREMENT,
  perName TEXT,
  perAge INT,
  perEducation TEXT
)
''');
  });
  log("TABLE CREATED");
}

void insertData(Model obj) async {
  Database localDB = await dataBase;
  await localDB.insert("Details", obj.pseronDetailsMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

Future<List<Model>> getData() async {
  Database localDB = await dataBase;
  List <Map<String,dynamic>>personDetailsList = await localDB.query("Details");
  log("$personDetailsList");
  log("FILLING DATA");
  return 
  List.generate(personDetailsList.length, (idx) {
    return Model(
        perName: personDetailsList[idx]["perName"],
        perAge: personDetailsList[idx]["perAge"],
        perEducation: personDetailsList[idx]["perEducation"],
        personId: personDetailsList[idx]['personId']);
  });
}

Future updateDate(Model obj) async {
  Database localDB = await dataBase;
  await localDB.update("Details", obj.pseronDetailsMap(),
      where: "personId=?", whereArgs: [obj.personId]);
}

Future clearTable() async {
  Database localDB = await dataBase;

  ///.delete USE TO CLEAR DATA IN TABLE
  await localDB.delete("Details");
  ///RESETS AUTOINCREMENT VALUE TO 1(personId)
// await localDB.execute("DELETE FROM sqflite_sequence WHERE name='data0601'");

  ///TO DELETE TABLE
 // await localDB.execute("DROP TABLE IF EXIST Details");
}
