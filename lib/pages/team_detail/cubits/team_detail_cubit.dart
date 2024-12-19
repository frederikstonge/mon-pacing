import 'dart:async';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/color_extensions.dart';
import '../../../models/constants.dart';
import '../../../models/performer_model.dart';
import '../../../models/team_model.dart';
import 'team_detail_state.dart';

class TeamDetailCubit extends Cubit<TeamDetailState> {
  final SettingsCubit settingsCubit;
  final TeamModel? team;
  final bool editMode;
  final FutureOr<void> Function(TeamModel value) onConfirm;

  TeamDetailCubit({
    required this.settingsCubit,
    required this.onConfirm,
    required this.editMode,
    this.team,
  }) : super(
          TeamDetailState(
            editMode: editMode,
            team: team != null
                ? editMode
                    ? team.copyWith()
                    : team.copyWith(id: 0)
                : TeamModel(
                    id: 0,
                    createdDate: DateTime.now(),
                    modifiedDate: DateTime.now(),
                    name: '',
                    color: 0,
                    performers: [],
                    matchId: null,
                  ),
          ),
        );

  Future<void> initialize() async {
    if (!state.editMode) {
      final random = Random();
      final newTeam = state.team.copyWith(
        color: Constants.colors.elementAt(random.nextInt(Constants.colors.length)).getIntvalue,
        performers: [_createPerformer(state.team.performers)],
      );
      emit(state.copyWith(team: newTeam));
    }
  }

  void edit(TeamModel team) {
    emit(state.copyWith(team: team));
  }

  void addPerformer() {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers.add(_createPerformer(performers));
    edit(team.copyWith(performers: performers));
  }

  void editPerformer(int index, PerformerModel performer) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers[index] = performer;
    edit(team.copyWith(performers: performers));
  }

  void removePerformer(int index) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);
    performers.removeAt(index);
    edit(team.copyWith(performers: performers));
  }

  void movePerformer(int oldIndex, int newIndex) {
    final team = state.team;
    final performers = List<PerformerModel>.from(team.performers);

    final performer = performers.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    performers.insert(newIndex, performer);
    edit(team.copyWith(performers: performers));
  }

  PerformerModel _createPerformer(List<PerformerModel> allPerformers) {
    final nextId = allPerformers.isNotEmpty ? allPerformers.map((e) => e.id).toList().reduce(max) + 1 : 0;
    return PerformerModel(id: nextId, name: '');
  }
}
