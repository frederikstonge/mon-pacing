import 'package:drift/drift.dart';

import '../../models/improvisation_type.dart';
import '../converters/int_list_converter.dart';
import 'pacing_entity.dart';

class PacingImprovisationEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  IntColumn get type => intEnum<ImprovisationType>()();
  TextColumn get category => text()();
  TextColumn get theme => text()();
  TextColumn get durationsInSeconds => text().map(const IntListConverter())();
  TextColumn get performers => text()();
  TextColumn get notes => text()();
  IntColumn get timeBufferInSeconds => integer()();
  IntColumn get huddleTimerInSeconds => integer()();
  TextColumn get integrationEntityId => text().nullable()();
  TextColumn get integrationAdditionalData => text().nullable()();
  IntColumn get pacing => integer().references(PacingEntity, #id)();
}