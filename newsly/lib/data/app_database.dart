/*
Singleton class for managing the app's database.
*/

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  // Private constructor
  AppDatabase._();

  // Singleton instance
  static final AppDatabase _instance = AppDatabase._();

  // Factory constructor to return the singleton instance
  factory AppDatabase() {
    return _instance;
  }

  Database? _database;

  // Getter for the database
  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'newsly.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables here
        await db.execute('''
          CREATE TABLE news (
            title TEXT primary key,
            author TEXT,
            image TEXT,
            description TEXT )
        ''');
      },
    );
  }
}


