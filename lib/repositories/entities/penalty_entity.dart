import 'package:drift/drift.dart';

import 'improvisation_entity.dart';
import 'match_entity.dart';
import 'performer_entity.dart';
import 'team_entity.dart';

class PenaltyEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
  BoolColumn get major => boolean()();
  TextColumn get type => text()();

  IntColumn get match => integer().references(MatchEntity, #id)();
  IntColumn get team => integer().references(TeamEntity, #id)();
  IntColumn get improvisation => integer().references(ImprovisationEntity, #id)();
  IntColumn get performer => integer().references(PerformerEntity, #id).nullable()();
}
