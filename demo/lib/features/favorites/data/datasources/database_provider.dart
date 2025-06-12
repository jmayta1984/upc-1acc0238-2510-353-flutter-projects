import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Database? _db;

  Future<Database> openDb() async {
    _db ??= await openDatabase(
      join(await getDatabasesPath(), 'easyshoes.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'create table favorites (id integer primary key, name text, image text, price integer)',
        );
      },
    );
    return _db as Database;
  }
}
