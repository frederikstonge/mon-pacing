import 'package:objectbox/objectbox.dart';

import 'performer_entity.dart';

@Entity()
class MatchTeamEntity {
  int id;
  String name;
  int color;
  String? integrationEntityId;
  String? integrationAdditionalData;

  final performers = ToMany<PerformerEntity>();

  MatchTeamEntity({
    this.id = 0,
    required this.name,
    required this.color,
    this.integrationEntityId,
    this.integrationAdditionalData,
  });
}
