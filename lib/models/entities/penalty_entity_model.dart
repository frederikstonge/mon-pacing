import 'package:objectbox/objectbox.dart';

@Entity()
class PenaltyEntityModel {
  @Id()
  int id;

  bool major;

  String type;

  String performer;

  int teamId;

  int improvisationId;

  PenaltyEntityModel({
    this.id = 0,
    required this.type,
    required this.major,
    required this.performer,
    required this.teamId,
    required this.improvisationId,
  });
}
