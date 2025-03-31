import 'package:objectbox/objectbox.dart';

@Entity()
class PenaltyEntity {
  int id;
  bool major;
  String type;
  int? performerId;
  int teamId;
  int improvisationId;

  PenaltyEntity({
    this.id = 0,
    required this.major,
    required this.type,
    required this.teamId,
    required this.improvisationId,
    this.performerId,
  });
}
