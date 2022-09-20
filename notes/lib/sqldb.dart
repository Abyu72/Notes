import 'dart:async';

import 'package:sqflite/sqflite.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'demo.db');
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 13, onUpgrade: _onupgrade);
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    print("on up grade>>>>>>>>>>>>>>>");
   // await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
  }

  _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "notes"(
"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"note" TEXT NOT NULL,
"title" TEXT NOT NULL,
"color"  TEXT NOT NULL



)


''');
    print("creat database and table>>>>>>>>>>>>>>>>");
  }

  readData(String sql) async {
    Database? mydb = await db;

    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deletData(String sql) async {
    Database? mydb = await db;

    int response = await mydb!.rawDelete(sql);
    return response;
  }

  mydeletdatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'demo.db');
    await deleteDatabase(path);
  }
}
