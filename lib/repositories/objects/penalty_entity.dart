import 'package:objectbox/objectbox.dart';

@Entity()
class PenaltyEntity {
  late int id;
  late bool major;
  late String type;
  late int? performerId;
  late int teamId;
  late int improvisationId;

  PenaltyEntity();
}
