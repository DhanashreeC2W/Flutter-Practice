import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_2025/player_model.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

Database? database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  databaseFactory = databaseFactoryFfiWeb;
  String path = await getDatabasesPath();
  log(path);

  database = await openDatabase(
    join(await getDatabasesPath(), "PlayerDB8.db"),
    version: 1,
    onCreate: (db, version) async {
      log("in on create");
      await db.execute('''
        create table Player(
          name text,
         jerNo int primary key ,
          avg real
        )
        ''');
    },
    onOpen: (db) {
      log("in on open");
    },
    onConfigure: (db) {
      log("in confi");
    },
  );
  PlayerModel player1 = PlayerModel(name: "Dhanshree", jerNo: 31, avg: 1000);
  PlayerModel player2 = PlayerModel(name: "Dhanshree", jerNo: 3, avg: 1000);
  // PlayerModel player3 = PlayerModel(name: "DD", jerNo: 24, avg: 2000);

  insertData(player1);
  insertData(player2);
  // insertData(player3);

  log("${await getdata()}");

  player2 = PlayerModel(name: "Dhana", jerNo: 3, avg: 1000);
  await updatedata(player2);
  log("${await getdata()}");
 await deleteData(player1.jerNo);
  log("${await getdata()}",name: "After delete");

}

void insertData(PlayerModel obj) async {
//Global variable madhe null pan data asu shakto
// mhanun local db gheun tyala await karaych manje data yenarach aahe he sure hot

  Database? localDB = database;
  localDB!.insert("Player", obj.playerMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);

  log("data added successfully");
  log("${obj.playerMap()}");
  log("$localDB");
}

Future<List<Map<String, dynamic>>> getdata() async {
  Database? localDB = database;
  List<Map<String, dynamic>> myData = await localDB!.query(
    "Player",
  );
  log("$myData", name: "MYDATA");
  return myData;
}

updatedata(PlayerModel obj) async {
  Database? localDB = database;
  await localDB!.update("Player", obj.playerMap(),
      where: "jerNo=?", whereArgs: [obj.jerNo]);
  log(obj.name);
}

deleteData(int obj) async {
  Database? localDB = database;
  await localDB!.delete("Player", where: "jerNo=?", whereArgs: [obj]);
  log("$obj");
}
