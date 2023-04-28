import 'package:flutter_todolist_sqlite_app/repositories/database_connection.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  DatabaseConnection _databaseConnection = DatabaseConnection();
  static Database? _database;

  Repository() {
    // initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    // initialize database if null
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  // Read data from table
  readData(table) async {
    var connection = await database;
    return await connection.query(table);
  }
}