import 'package:drift/drift.dart';

class TagEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
}
