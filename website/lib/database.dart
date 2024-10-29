import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Database {
  static var _database;

  static void createDatabase() async {
    _database = openDatabase(
      join(await getDatabasesPath(), 'code.db'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE Token(id INTEGER PRIMARY KEY, access_token TEXT, expires_in INTEGER, refresh_token TEXT, token_type TEXT)");
      },
      version: 1,
    );
  }
}
