import 'package:flutter_application_1/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:path/path.dart';

dynamic dataBase;

void createTable() async {
  dataBase = await openDatabase(join(await getDatabasesPath(), "dataaaaaa1.db"),
      version: 1, onCreate: (db, version) {
    db.execute('''
            CREATE TABLE Details(
  personId INT PRIMARY KEY,
  perName TEXT,
  personId INT,
  perEducation TEXT
)
''');
  });
  print("TABLE CREATED");
}


void insertData(Model obj) async {
  Database localDB = await dataBase;
 await localDB.insert("Details", obj.pseronDetailsMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
  
}

Future<List<Map>> getData() async {
  Database localDB = await dataBase;
  List<Map> personDetailsList = await localDB.query("Details");
  return personDetailsList;

}

Future updateDate(Model obj) async {
  Database localDB = await dataBase;
  await localDB.update("Details", obj.pseronDetailsMap(),
      where: "personId=?", whereArgs: [obj.personId]);
}
