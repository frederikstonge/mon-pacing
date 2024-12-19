import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../models/improvisation_model.dart';
import '../models/match_team_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/performer_model.dart';

part 'database_repository.g.dart';

class TagsConverter extends TypeConverter<List<String>, String> with JsonTypeConverter<List<String>, String> {
  static const separator = ',';
  const TagsConverter();

  @override
  List<String> fromSql(String fromDb) {
    return fromDb.split(separator);
  }

  @override
  String toSql(List<String> value) {
    return value.join(separator);
  }
}

class PacingEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get tags => text().map(const TagsConverter())();
  TextColumn get improvisations => text().map(ImprovisationModel.converter)();
  IntColumn get defaultNumberOfTeams => integer().withDefault(const Constant(2))();

  TextColumn get integrationId => text().nullable()();
  TextColumn get integrationEntityId => text().nullable()();
  TextColumn get integrationAdditionalData => text().nullable()();
}

class MatchEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  TextColumn get tags => text().map(const TagsConverter())();
  TextColumn get teams => text().map(MatchTeamModel.converter)();
  TextColumn get improvisations => text().map(MatchTeamModel.converter)();
  TextColumn get penalties => text().map(MatchTeamModel.converter)();
  TextColumn get points => text().map(MatchTeamModel.converter)();
  TextColumn get stars => text().map(MatchTeamModel.converter)();
  BoolColumn get enableStatistics => boolean().withDefault(const Constant(true))();
  BoolColumn get enablePenaltiesImpactPoints => boolean().withDefault(const Constant(true))();
  IntColumn get penaltiesImpactType => intEnum<PenaltiesImpactType>().withDefault(Constant(PenaltiesImpactType.addPoints.index))();
  IntColumn get penaltiesRequiredToImpactPoints => integer().withDefault(const Constant(3))();
  BoolColumn get enableMatchExpulsion => boolean().withDefault(const Constant(true))();
  IntColumn get penaltiesRequiredToExpel => integer().withDefault(const Constant(3))();
  TextColumn get integrationId => text().nullable()();
  TextColumn get integrationEntityId => text().nullable()();
  TextColumn get integrationAdditionalData => text().nullable()();
  IntColumn get integrationRestrictMaximumPointPerImprovisation => integer().nullable()();
  IntColumn get integrationMinNumberOfImprovisations => integer().nullable()();
  IntColumn get integrationMaxNumberOfImprovisations => integer().nullable()();
  TextColumn get integrationPenaltyTypes => text().map(const TagsConverter()).nullable()();
}

class TeamEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get color => integer()();
  TextColumn get performers => text().map(PerformerModel.converter)();
  TextColumn get tags => text().map(const TagsConverter())();
}

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
