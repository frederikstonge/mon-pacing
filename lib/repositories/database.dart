import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String pacingsTable = "Pacings";
const String improvisationsTable = "Improvisations";
const String idField = "id";
const String nameField = "name";
const String createdDateField = "createdDate";
const String modifiedDateField = "modifiedDate";
const String typeField = "type";
const String categoryField = "category";
const String themeField = "theme";
const String durationField = "duration";
const String performersField = "performers";
const String pacingIdField = "pacingId";

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
              $modifiedDateField text)
            ''');

  await db.execute('''
              CREATE TABLE $improvisationsTable(
              $idField integer primary key autoincrement,
              $nameField text not null,
              $typeField integer not null,
              $categoryField text,
              $themeField text,
              $durationField text not null,
              $performersField integer not null,
              $pacingIdField integer not null,
              FOREIGN KEY($pacingIdField) REFERENCES $pacingsTable(id))
            ''');
}
