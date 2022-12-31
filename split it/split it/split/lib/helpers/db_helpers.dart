import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DbHelpers {
  // Future<Database> initializeDB() async {
  //   String path = await getDatabasesPath();

  //   return sql.openDatabase(
  //     join(path, 'split.db'),
  //     onCreate: (db, version) async {
  //       await db.execute(
  //         "CREATE TABLE SplitIt(item TEXT, price REAL , date TEXT, name TEXT,payementMethod TEXT)",
  //       );
  //     },
  //     version: 1,
  //   );
  // }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final dbPath = await sql.getDatabasesPath();

    sql.openDatabase(path.join(dbPath, 'split.db'),
         onCreate: (db, version) async {
            return await db.execute(
              "CREATE TABLE SplitIt(item TEXT, price REAL , date TEXT, name TEXT,payementMethod TEXT)",
            );
          },
          version: 1,
    );  


  }
}
