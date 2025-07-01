import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {

  static final String dbName = 'app_database.db';
  static final String tableName = 'photos';
  static final int version = 1;

  static final  String createTableQuery = '''
    CREATE TABLE $tableName (
      id INTEGER PRIMARY KEY,
      image TEXT,
      camera TEXT,
      rover TEXT
    )
  ''';

  static final _instance = AppDatabase._internal(); 
  AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }
  
  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute(createTableQuery);
      },
    );
  }
}