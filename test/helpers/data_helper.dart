import 'dart:math';

import 'package:mon_pacing/models/constants.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/match_team_model.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/models/team_model.dart';

class DataHelper {
  static PacingModel getPacing(String name, List<ImprovisationModel> improvisations) => PacingModel(
        id: 0,
        name: name,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        improvisations: improvisations,
      );

  static MatchModel getMatch(String name, List<MatchTeamModel> teams, List<ImprovisationModel> improvisations) => MatchModel(
        id: 0,
        name: name,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        teams: teams,
        improvisations: improvisations,
        penalties: [],
        points: [],
      );

  static TeamModel getTeam(String name) => TeamModel(
        id: 0,
        createdDate: DateTime.now(),
        modifiedDate: DateTime.now(),
        name: name,
        color: Constants.colors.elementAt(Random().nextInt(Constants.colors.length)).value,
      );
}
