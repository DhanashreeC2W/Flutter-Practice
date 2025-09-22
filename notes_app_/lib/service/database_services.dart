import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServices {
  Future<Database> createDB() async {
    Database database =
        await openDatabase(join(await getDatabasesPath(), "NotesDB.db"));
        
    return database;
  }
}
