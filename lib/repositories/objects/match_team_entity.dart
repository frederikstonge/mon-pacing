import 'package:objectbox/objectbox.dart';

import 'performer_entity.dart';

@Entity()
class MatchTeamEntity {
  late int id;
  late String name;
  late int color;
  late String? integrationEntityId;
  late String? integrationAdditionalData;

  final performers = ToMany<PerformerEntity>();

  MatchTeamEntity();
}
