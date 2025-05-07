import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:toastification/toastification.dart';

import '../../../cubits/matches/matches_cubit.dart';
import '../../../extensions/match_extensions.dart';
import '../../../l10n/localizer.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';
import '../../../models/point_model.dart';
import '../../../models/star_model.dart';
import '../../../repositories/matches_repository.dart';
import '../../../services/analytics_service.dart';
import '../../../services/excel_service.dart';
import '../../../services/toaster_service.dart';
import 'match_state.dart';
import 'match_status.dart';

class MatchCubit extends Cubit<MatchState> {
  final MatchesRepository matchesRepository;
  final MatchesCubit matchesCubit;
  final ToasterService toasterService;
  final ExcelService excelService;
  final AnalyticsService analyticsService;

  MatchCubit({
    required this.matchesRepository,
    required this.matchesCubit,
    required this.toasterService,
    required this.excelService,
    required this.analyticsService,
  }) : super(const MatchState(status: MatchStatus.initial));

  Future<void> initialize(int id, {int? improvisationId, int? durationIndex}) async {
    emit(state.copyWith(status: MatchStatus.loading));

    final matchEntity = await matchesRepository.get(id);
    if (matchEntity == null) {
      emit(state.copyWith(status: MatchStatus.error, error: Localizer.current.toasterGenericError));
      return;
    }
    final match = MatchModel.fromEntity(entity: matchEntity);
    var selectedImprovisationIndex =
        improvisationId != null ? match.improvisations.indexWhere((i) => i.id == improvisationId) : 0;
    selectedImprovisationIndex = selectedImprovisationIndex >= 0 ? selectedImprovisationIndex : 0;

    emit(
      state.copyWith(
        status: MatchStatus.success,
        match: match,
        selectedImprovisationIndex: selectedImprovisationIndex,
        selectedDurationIndex: durationIndex ?? 0,
      ),
    );

    _validatePenalties(match);
  }

  Future<void> edit(MatchModel match) async {
    emit(state.copyWith(status: MatchStatus.success, match: match));
    await matchesCubit.edit(match);
  }

  Future<void> addImprovisation(ImprovisationModel improvisation, int index) async {
    final improvisations = List<ImprovisationModel>.from(state.match!.improvisations);

    improvisations.insert(index, improvisation);
    final newMatch = state.match!.copyWith(improvisations: improvisations);
    emit(
      state.copyWith(
        status: MatchStatus.success,
        match: newMatch,
        selectedImprovisationIndex: index,
        selectedDurationIndex: 0,
      ),
    );

    await matchesCubit.edit(newMatch);
  }

  Future<void> editImprovisation(ImprovisationModel improvisation, int index) async {
    final improvisations = List<ImprovisationModel>.from(
      state.match!.improvisations.where((element) => element.id != improvisation.id),
    );

    improvisations.insert(index, improvisation);
    final newMatch = state.match!.copyWith(improvisations: improvisations);

    emit(
      state.copyWith(
        status: MatchStatus.success,
        match: newMatch,
        selectedImprovisationIndex: index,
        selectedDurationIndex: 0,
      ),
    );

    await matchesCubit.edit(newMatch);
  }

  Future<void> removeImprovisation(ImprovisationModel improvisation) async {
    final improvisations = List<ImprovisationModel>.from(
      state.match!.improvisations.where((element) => element.id != improvisation.id),
    );

    final points = List<PointModel>.from(
      state.match!.points.where((element) => element.improvisationId != improvisation.id),
    );

    final penalties = List<PenaltyModel>.from(
      state.match!.penalties.where((element) => element.improvisationId != improvisation.id),
    );

    final newSelectedImprovisationIndex =
        state.selectedImprovisationIndex >= improvisations.length
            ? state.selectedImprovisationIndex - 1
            : state.selectedImprovisationIndex;

    final newMatch = state.match!.copyWith(improvisations: improvisations, points: points, penalties: penalties);

    emit(
      state.copyWith(
        status: MatchStatus.success,
        match: newMatch,
        selectedImprovisationIndex: newSelectedImprovisationIndex,
        selectedDurationIndex: 0,
      ),
    );

    await matchesCubit.edit(newMatch);
  }

  void changePage(int page) {
    emit(state.copyWith(status: MatchStatus.success, selectedImprovisationIndex: page, selectedDurationIndex: 0));
  }

  void changeDuration(int durationIndex) {
    emit(state.copyWith(status: MatchStatus.success, selectedDurationIndex: durationIndex));
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    final points = List<PointModel>.from(state.match!.copyWith().points);
    if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
      final index = points.indexWhere(
        (element) => element.teamId == teamId && element.improvisationId == improvisationId,
      );
      if (value > 0) {
        points[index] = points[index].copyWith(value: value);
      } else {
        points.removeAt(index);
      }
    } else {
      if (value > 0) {
        points.add(PointModel(id: 0, teamId: teamId, improvisationId: improvisationId, value: value));
      }
    }

    final newMatch = state.match!.copyWith(points: points);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));
    await matchesCubit.edit(newMatch);
  }

  Future<void> addPenalty(PenaltyModel penalty) async {
    final penalties = List<PenaltyModel>.from(state.match!.copyWith().penalties);
    penalties.add(penalty);
    final newMatch = state.match!.copyWith(penalties: penalties);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
    _validatePenalty(newMatch, penalty);
  }

  Future<void> editPenalty(PenaltyModel penalty) async {
    final penalties = List<PenaltyModel>.from(state.match!.copyWith().penalties);
    final index = penalties.indexWhere((element) => element.id == penalty.id);
    penalties[index] = penalty;
    final newMatch = state.match!.copyWith(penalties: penalties);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
    _validatePenalty(newMatch, penalty);
  }

  Future<void> removePenalty(int penaltyId) async {
    final penalties = List<PenaltyModel>.from(state.match!.copyWith().penalties);
    penalties.removeWhere((element) => element.id == penaltyId);
    final newMatch = state.match!.copyWith(penalties: penalties);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
  }

  Future<void> addStar() async {
    final stars = List<StarModel>.from(state.match!.copyWith().stars);
    stars.add(
      StarModel(id: 0, teamId: state.match!.teams.first.id, performerId: state.match!.teams.first.performers.first.id),
    );
    final newMatch = state.match!.copyWith(stars: stars);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
  }

  Future<void> editStar(StarModel star) async {
    final stars = List<StarModel>.from(state.match!.copyWith().stars);
    final index = stars.indexWhere((element) => element.id == star.id);
    stars[index] = star;
    final newMatch = state.match!.copyWith(stars: stars);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
  }

  Future<void> removeStar(int starId) async {
    final stars = List<StarModel>.from(state.match!.copyWith().stars);
    stars.removeWhere((element) => element.id == starId);
    final newMatch = state.match!.copyWith(stars: stars);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
  }

  Future<void> moveStar(int oldIndex, int newIndex) async {
    final stars = List<StarModel>.from(state.match!.copyWith().stars);
    final star = stars.removeAt(oldIndex);

    if (oldIndex < newIndex) {
      newIndex--;
    }

    stars.insert(newIndex, star);

    final newMatch = state.match!.copyWith(stars: stars);

    emit(state.copyWith(status: MatchStatus.success, match: newMatch));

    await matchesCubit.edit(newMatch);
  }

  Future<bool> exportExcel() async {
    try {
      final bytes = excelService.exportMatchToExcel(state.match!, Localizer.current);

      if (bytes == null) {
        return false;
      }

      final data = Uint8List.fromList(bytes);
      final fileName = sanitizeFilename('${state.match!.name}.xlsx', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      await analyticsService.logExportToExcel();
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: Localizer.current.toasterMatchResultExported);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: Localizer.current.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }

  void _validatePenalty(MatchModel match, PenaltyModel penalty) {
    if (match.enableMatchExpulsion && penalty.performerId != null) {
      final penaltyPoints = match.getTotalPenaltyValuesByPerformerId(penalty.teamId, penalty.performerId!);

      if (penaltyPoints >= match.penaltiesRequiredToExpel) {
        final performer = match.teams
            .firstWhere((t) => t.id == penalty.teamId)
            .performers
            .firstWhere((p) => p.id == penalty.performerId);
        toasterService.show(
          title: Localizer.current.warningExpelPlayerTitle,
          description: Localizer.current.warningExpelPlayerDescription(
            performer: performer.name,
            penalty: penaltyPoints,
          ),
          type: ToastificationType.warning,
          autoClose: false,
        );
      }
    }
  }

  void _validatePenalties(MatchModel match) {
    if (match.enableMatchExpulsion) {
      for (final team in match.teams) {
        for (final performer in team.performers) {
          final penaltyPoints = match.getTotalPenaltyValuesByPerformerId(team.id, performer.id);

          if (penaltyPoints >= match.penaltiesRequiredToExpel) {
            toasterService.show(
              title: Localizer.current.warningExpelPlayerTitle,
              description: Localizer.current.warningExpelPlayerDescription(
                performer: performer.name,
                penalty: penaltyPoints,
              ),
              type: ToastificationType.warning,
              autoClose: false,
            );
          }
        }
      }
    }
  }
}
