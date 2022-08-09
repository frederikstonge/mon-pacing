import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class PacingsRepository {
  static const String pacings = "Pacings";
  static const String improvisations = "Improvisations";

  Future<Database> getDatabase() async {
    var path = await getDatabasesPath();
    return await openDatabase(
      join(path, 'mon_pacing.db'),
      onCreate: (db, version) async {
        await db.execute('''
              CREATE TABLE $pacings(
              id integer primary key autoincrement,
              name text not null,
              createdDate text not null,
              modifiedDate text)
            ''');

        await db.execute('''
              CREATE TABLE $improvisations(
              id integer primary key autoincrement,
              name text not null,
              type integer not null,
              category text,
              theme text,
              duration text not null,
              performers integer not null,
              pacingId integer not null,
              FOREIGN KEY(pacingid) REFERENCES $pacings(id))
            ''');
      },
      version: 1,
    );
  }
}
