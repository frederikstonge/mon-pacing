import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/settings/settings_cubit.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/improvisation_type.dart';
import '../../../models/match_model.dart';
import 'match_improvisation_state.dart';

class MatchImprovisationCubit extends Cubit<MatchImprovisationState> {
  final ImprovisationModel? improvisation;
  final MatchModel match;
  final SettingsCubit settingsCubit;
  final FutureOr<void> Function(ImprovisationModel improvisation, int index) onConfirm;

  MatchImprovisationCubit({
    this.improvisation,
    required this.onConfirm,
    required this.match,
    required this.settingsCubit,
  }) : super(
         MatchImprovisationState(
           editMode: improvisation != null,
           improvisation:
               improvisation ??
               ImprovisationModel(
                 id: 0,
                 order: match.improvisations.length + 1,
                 type: ImprovisationType.values[match.improvisations.length % 2],
                 durationsInSeconds: [settingsCubit.state.defaultImprovisationDurationInSeconds],
                 category: '',
                 performers: '',
                 theme: '',
                 notes: '',
                 timeBufferInSeconds: settingsCubit.state.defaultTimeBufferInSeconds,
                 huddleTimerInSeconds: settingsCubit.state.defaultHuddleTimerInSeconds,
               ),
           index:
               improvisation != null
                   ? match.improvisations.indexWhere((element) => element.id == improvisation.id)
                   : match.improvisations.length,
         ),
       );

  void edit(ImprovisationModel improvisation) {
    emit(state.copyWith(improvisation: improvisation));
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
