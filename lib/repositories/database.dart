//import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String pacingsTable = "Pacings";
const String idField = "id";
const String nameField = "name";
const String createdDateField = "createdDate";
const String modifiedDateField = "modifiedDate";
const String improvisationsField = "improvisations";

Database? _database;

Future<Database> get database async {
  if (_database != null) {
    return _database!;
  }

  _database = await _getDatabase();
  return _database!;
}

Future<Database> _getDatabase() async {
  var path = await getDatabasesPath();

  // var file = File('$path/mon_pacing.db');
  // if (await file.exists()) {
  //   await file.delete(recursive: true);
  // }

  return await openDatabase(
    join(path, 'mon_pacing.db'),
    onCreate: _onCreate,
    version: 1,
  );
}

Future<void> _onCreate(Database db, int version) async {
  await db.execute('''
              CREATE TABLE $pacingsTable(
              $idField integer primary key autoincrement,
              $nameField text not null,
              $createdDateField text not null,
              $modifiedDateField text,
              $improvisationsField text)
            ''');
}
