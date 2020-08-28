import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DBHelper {
  //-----------------------------USER DATABASE---------------------------//

  // A method to get a path and connection to the database
  // if the database is not present a new database table is created
  static Future<Database> database() async {
    // gives a path to the database on device
    final dbPath = await sql.getDatabasesPath();
    // Created a db file users.db and a table with
    // the provided parameters
    return sql.openDatabase(path.join(dbPath, 'users.db'),
        onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE users(email TEXT ,username TEXT, password TEXT)');

      db.execute('CREATE TABLE cart(user TEXT ,bookId INTEGER)');

      db.execute('CREATE TABLE library(user TEXT,bookId INTEGER)');

      db.execute('CREATE TABLE bucks(user TEXT,cash REAL)');
    }, version: 1);
  }

  // A query to insert user data to the table
  // usually used in signup mode
  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    try {
      db.insert(
        table,
        data,
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    } catch (error) {
      throw error;
    }
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DBHelper.database();
    return db.query(table);
  }

  // ---------------------------- CART DATABASE -------------------------//

  static Future<void> insertCart(String table, Map<String, Object> data) async {
    final db = await database();
    db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getCartData(String table,String user) async {
    final db = await DBHelper.database();
    return db.query(table,where: "user=?",whereArgs: [user]);
  }

  static Future<void> removeCartItem(String table,int bookId)async{
    final db= await database();
    return db.delete(table,where: "bookId=?",whereArgs: [bookId]);

  }
  //---------------------------- LIBRARY DATABASE --------------------------//


  static Future<void> insertLibrary(String table,Map<String,Object> data)async{
    final db = await database();
    return db.insert(table, data,conflictAlgorithm:ConflictAlgorithm.fail);

  }

  static Future<List<Map<String,Object>>> getLibraryData(String table,String user)async{
    final db = await database();
    return db.query(table,where:"user = ?",whereArgs: [user]);
    
  }

  static Future<void> clearLibrary(String table)async{
    final db= await database();
   return db.delete(table);
  }

//-------------------------- User Currency-----------------------------------//

 
static Future<void> insertBucks(String table,Map<String,Object> data)async{

final database= await DBHelper.database();
return database.insert(table, data);

}

static Future<List<Map<String,Object>>> getUserBucks(String table,String user)async{
  final database= await DBHelper.database();
  return database.query(table,where:"user = ?",whereArgs:[user]);
}

static Future<void> transaction(String table,String user,double amount)async{
final db= await DBHelper.database();
return db.update(table, {'cash':amount},where: "user=?",whereArgs: [user]);
}



}
