import 'package:drift/drift.dart';

import 'tag_entity.dart';
import 'team_entity.dart';

class TeamTagEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();

  IntColumn get tag => integer().references(TagEntity, #id)();
  IntColumn get team => integer().references(TeamEntity, #id)();
}
