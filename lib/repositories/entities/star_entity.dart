import 'package:drift/drift.dart';

import 'performer_entity.dart';
import 'team_entity.dart';

class StarEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();

  IntColumn get performer => integer().references(PerformerEntity, #id)();
  IntColumn get team => integer().references(TeamEntity, #id)();
}
