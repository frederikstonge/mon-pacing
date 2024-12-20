import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'entities/match_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/team_entity.dart';

part 'database_repository.g.dart';

@DriftDatabase(tables: [PacingEntity, MatchEntity, TeamEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'my_database');
  }
}
