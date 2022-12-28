//import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String pacingsTable = "Pacings";
const String matchesTable = "Matches";
const String idField = "id";
const String nameField = "name";
const String createdDateField = "createdDate";
const String modifiedDateField = "modifiedDate";
const String improvisationsField = "improvisations";
const String teamsField = "teams";
const String penaltiesField = "penalties";
const String pointsField = "points";

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
    onUpgrade: _onUpgrade,
    onDowngrade: _onUpgrade,
    version: 1,
  );
}

Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
  await db.execute(''' 
    DROP TABLE IF EXISTS $pacingsTable
  ''');

  await db.execute(''' 
    DROP TABLE IF EXISTS $matchesTable
  ''');

  _onCreate(db, newVersion);
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

  await db.execute('''
    CREATE TABLE $matchesTable(
    $idField integer primary key autoincrement,
    $nameField text not null,
    $createdDateField text not null,
    $modifiedDateField text,
    $improvisationsField text,
    $teamsField text,
    $penaltiesField text,
    $pointsField text)
  ''');
}
