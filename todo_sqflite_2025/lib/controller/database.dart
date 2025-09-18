import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
 Future<Database> createDatabase() async {
    Database db1 = await openDatabase(
      join(await getDatabasesPath(), "TodoDB.db"),
      onCreate: (db, version) {
        db.execute("""
  CREATE TABLE Todo(
    title TEXT,
    descr TEXT,
    date INT,
    id INTEGER PRIMARY KEY AUTOINCREAMENT
  )

""");
      },
    );
    return db1;
  }


  void insertData()async{
    Database localDB =await createDatabase();
    localDB.i
  }
}
