import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../models/penalties_impact_type.dart';
import '../services/toaster_service.dart';
import 'converters/string_list_converter.dart';
import 'entities/improvisation_entity.dart';
import 'entities/match_entity.dart';
import 'entities/match_tag_entity.dart';
import 'entities/pacing_entity.dart';
import 'entities/pacing_tag_entity.dart';
import 'entities/penalty_entity.dart';
import 'entities/performer_entity.dart';
import 'entities/point_entity.dart';
import 'entities/star_entity.dart';
import 'entities/tag_entity.dart';
import 'entities/team_entity.dart';
import 'entities/team_tag_entity.dart';
import 'legacy_database_repository.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    PacingEntity,
    MatchEntity,
    TeamEntity,
    ImprovisationEntity,
    PenaltyEntity,
    PerformerEntity,
    PointEntity,
    StarEntity,
    TagEntity,
    PacingTagEntity,
    MatchTagEntity,
    TeamTagEntity,
  ],
)
class AppDatabase extends _$AppDatabase {
  final LegacyDatabaseRepository legacyDatabaseRepository;
  final ToasterService toasterService;

  AppDatabase({
    required this.legacyDatabaseRepository,
    required this.toasterService,
  }) : super(
          _openConnection(),
        );

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // Enable foreign keys
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (m) async {
          await m.createAll();

          // Run migrations from the legacy database
        },
      );

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'mon_pacing');
  }
}
