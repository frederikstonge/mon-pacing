import 'package:drift/drift.dart';

class PacingEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get defaultNumberOfTeams => integer().withDefault(const Constant(2))();

  TextColumn get integrationId => text().nullable()();
  TextColumn get integrationEntityId => text().nullable()();
  TextColumn get integrationAdditionalData => text().nullable()();
}
