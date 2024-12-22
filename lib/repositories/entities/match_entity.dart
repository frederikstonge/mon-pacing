import 'package:drift/drift.dart';

import '../../models/penalties_impact_type.dart';
import '../converters/string_list_converter.dart';

class MatchEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get modifiedDate => dateTime().withDefault(Constant(DateTime.now()))();
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
  TextColumn get integrationPenaltyTypes => text().map(const StringListConverter()).nullable()();
}
