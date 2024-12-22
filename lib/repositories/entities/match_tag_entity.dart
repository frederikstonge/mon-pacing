import 'package:drift/drift.dart';

import 'match_entity.dart';
import 'tag_entity.dart';

class MatchTagEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();

  IntColumn get tag => integer().references(TagEntity, #id)();
  IntColumn get match => integer().references(MatchEntity, #id)();
}
