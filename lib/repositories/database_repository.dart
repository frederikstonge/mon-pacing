import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../services/toaster_service.dart';
import 'entities/match_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/team_entity.dart';
import 'legacy_database_repository.dart';

part 'database_repository.g.dart';

@DriftDatabase(tables: [PacingEntity, MatchEntity, TeamEntity])
class AppDatabase extends _$AppDatabase {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final ToasterService toasterService;

  AppDatabase({
    required this.legacyDatabaseRepository,
    required this.toasterService,
  }) : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');

          if (details.wasCreated) {
            // Migrate data from the legacy database
          }
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'mon_pacing_drift');
  }
}
