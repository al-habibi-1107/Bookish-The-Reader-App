import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // A method to get a path and connection to the database
  // if the database is not present a new database table is created 
  static Future<Database> database() async {
    // gives a path to the database on device
    final dbPath = await sql.getDatabasesPath();
    // Created a db file users.db and a table with
    // the provided parameters
    return sql.openDatabase(path.join(dbPath, 'users.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE users(email TEXT ,username TEXT, password TEXT)');
    }, version: 1);
  }

  // A query to insert user data to the table
  // usually used in signup mode
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
   try{ db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );}catch(error){
      throw error;
    }
  }

  static Future<List<Map<String,dynamic>>> getData(String table) async{

  final db = await DBHelper.database();
  return db.query(table);
  }
}