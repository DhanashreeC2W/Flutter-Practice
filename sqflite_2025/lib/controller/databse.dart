import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class databaseDemo{
  Future<Database> createDatabase() async {
   Database db=  await openDatabase(
      join(await getDatabasesPath(),"todoDB.db"),
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
            CREATE TABLE TODO(
             id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
           discription TEXT,
            date TEXT
            )
''' );
      },
      );
      return db;

 
  }
   Future<List<Map>> getdatabase() async{
    Database localDB=await createDatabase();
     List<Map> list= await localDB.query("TODO");
     return list;

  }
  insertDatabase(Map<String,dynamic> obj)async{
    Database localDB=await createDatabase();
     await localDB.insert("TODO",obj,conflictAlgorithm: ConflictAlgorithm.replace );
    
  }
   Future<void> updateDatabase(Map<String,dynamic> obj)async{
    Database localDB=await createDatabase();
     await localDB.update("TODO", obj,
    where:"id=?",
    whereArgs: [obj['id']]
    );
    
  }
  Future<void>  deleteDatabase(int index)async{
    Database localDB=await createDatabase();
    await localDB.delete("TODO",
    where: "id=?",
    whereArgs:[index] );

  }

}