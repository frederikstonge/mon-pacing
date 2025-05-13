import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'legacy_entities/match_entity.dart';
import 'legacy_entities/pacing_entity.dart';
import 'legacy_entities/team_entity.dart';

class LegacyDatabaseRepository {
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
      schemas: [PacingEntitySchema, MatchEntitySchema, TeamEntitySchema],
      directory: dir.path,
    );
  }
}
