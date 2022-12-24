import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

import '../generated/l10n.dart';
import '../models/match_model.dart';
import '../models/team_model.dart';

class MatchCubit extends Cubit<MatchModel> {
  TextEditingController nameController = TextEditingController();
  List<TextEditingController> controllers = [];

  MatchCubit({required MatchModel model}) : super(model) {
    nameController.text = model.name;
    controllers = model.teams
        .map(
          (e) => TextEditingController(text: e.name),
        )
        .toList();
  }

  void initialize() {
    if (state.teams.isEmpty) {
      addTeam();
      addTeam();
    }
  }

  void editName(String name) {
    emit(state.copyWith(name: name));
  }

  void editTeam(TeamModel team) {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    teams[team.order] = team;

    emit(state.copyWith(teams: teams));
  }

  void removeTeam(TeamModel team) {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    teams.removeAt(team.order);
    controllers.removeAt(team.order);
    _reOrderTeams(teams);

    emit(state.copyWith(teams: teams));
  }

  void addTeam() {
    var teams = List<TeamModel>.from(state.copyWith().teams);
    var nextOrder = teams.isNotEmpty ? teams.map((e) => e.order).toList().reduce(max) + 1 : 0;
    var nextId = teams.isNotEmpty ? teams.map((e) => e.id).toList().reduce(max) + 1 : 0;
    var team = _createRandomTeam(nextId, nextOrder);

    teams.add(team);
    controllers.add(TextEditingController(text: team.name));
    emit(state.copyWith(teams: teams));
  }

  List<TeamModel> _reOrderTeams(List<TeamModel> teams) {
    for (var i = 0; i < teams.length; i++) {
      teams[i] = teams[i].copyWith(order: i);
    }

    return teams;
  }

  TeamModel _createRandomTeam(int id, int order) {
    var random = Random();
    return TeamModel(
      id: id,
      order: order,
      name: '${S.current.MatchOptionsView_Team} ${order + 1}',
      color: Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1).value,
    );
  }
}
