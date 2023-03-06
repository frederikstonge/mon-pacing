import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {
  static String pacingsTable = "Pacings";
  static String matchesTable = "Matches";
  static String idField = "id";
  static String nameField = "name";
  static String createdDateField = "createdDate";
  static String modifiedDateField = "modifiedDate";
  static String improvisationsField = "improvisations";
  static String teamsField = "teams";
  static String penaltiesField = "penalties";
  static String pointsField = "points";

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _getDatabase();
    return _database!;
  }

  Future<Database> _getDatabase() async {
    String path;
    if (Platform.isIOS) {
      final directory = await getLibraryDirectory();
      path = directory.path;
    } else {
      path = await getDatabasesPath();
    }

    final filePath = join(path, 'mon_pacing.db');

    // var file = File(filePath);
    // if (await file.exists()) {
    //   await file.delete(recursive: true);
    // }

    return await openDatabase(
      filePath,
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
}
