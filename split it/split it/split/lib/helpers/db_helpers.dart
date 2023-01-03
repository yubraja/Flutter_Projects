import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(
      path.join(dbPath, 'split.db'),
      onCreate: (db, version) async {
        return await db.execute(
          "CREATE TABLE SplitIt(item TEXT, price REAL , date TEXT, name TEXT,paymentMethod TEXT,id TEXT)",
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();

    db.insert(table, data);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }

  static Future<void> deleteAll(String table) async {
    final db = await DbHelper.database();

    await db.delete(table);
  }

  static Future<void> deleteOne(String table, String id) async {
    final db = await DbHelper.database();

    await db.delete(
      table,
      where: 'id =?',
      whereArgs: [id],
    );
  }
}
