import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../models/team_model.dart';

class DatabaseRepository {
  Isar? _database;

  Future<Isar> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _getDatabase();
    return _database!;
  }

  Future<Isar> _getDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.openAsync(
      schemas: [PacingModelSchema, MatchModelSchema, TeamModelSchema],
      directory: dir.path,
    );
  }
}
