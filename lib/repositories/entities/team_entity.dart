import 'package:drift/drift.dart';

import 'match_entity.dart';

class TeamEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get color => integer()();

  IntColumn get match => integer().references(MatchEntity, #id).nullable()();

  TextColumn get integrationId => text().nullable()();
  TextColumn get integrationEntityId => text().nullable()();
  TextColumn get integrationAdditionalData => text().nullable()();
}
