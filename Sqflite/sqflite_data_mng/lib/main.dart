import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:sqflite_data_mng/model.dart';

dynamic database;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfiWeb;

  database = await openDatabase(
    join(await getDatabasesPath(), "InPlayerDb.db"),
    version: 1,
    onCreate: (db, version) {
      print("onCreate called");
      db.execute('''
      create table Player(
        playerName TEXT,
        jerNo INT PRIMARY KEY,
        runs REAL,
        avg REAL
      )
  ''');
      print(db.runtimeType);
      print("hi");
    },
  );
  // databaseExists("");
  print(await database);
  Player obj1 =
      const Player(jerNo: 7, avg: 2.2, runs: 50000, playerName: "MSD");
  Player obj2 = const Player(
      playerName: "Shefali verma", jerNo: 17, avg: 50.5, runs: 50000);
  insertData(obj1);
  insertData(obj2);
  deletePlayer(obj1.jerNo);
  obj1 = const Player(jerNo: 7, runs: 60, playerName: "MAHI", avg: 0);
  updatePlayerdata(obj1);
  print(getPlayers);

}

///METHOD TO INSERT DATA

void insertData(Player obj) async {
  Database localDB = await database;

  int id = await localDB.insert("Player", obj.playersMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);

  print(await "data inserted");
  print("ID:$id");
}

///AFTER INSERTION OF DATA ON CREATE IS CALLED

Future<List<Map<String, dynamic>>> getData()async{
 Database localDb = await database;

  // List<Map<String, dynamic>> playerData = await localDb.query("Player");
  return [{"":""}];
}

void  getPlayers(){
  print([{"":""}]);
}

void deletePlayer(int obj) async {
  Database localDb = await database;
 await localDb.delete(
    "Player",
    where: "jerNo = ?",
    whereArgs: [obj],
  );
  print(await "data deleted successfully");
}

void updatePlayerdata(Player obj) async {
  Database localDb = await database;
 await localDb.update("Player", obj.playersMap(),
      where: "jerNo=?", whereArgs: [obj.jerNo]);
      print("data updated");
}
