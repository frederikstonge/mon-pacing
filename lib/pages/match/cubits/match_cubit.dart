import 'dart:math';

import 'package:collection/collection.dart';
import 'package:excel/excel.dart' as excel;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:sanitize_filename/sanitize_filename.dart';
import 'package:toastification/toastification.dart';

import '../../../cubits/matches/matches_cubit.dart';
import '../../../cubits/settings/settings_cubit.dart';
import '../../../extensions/match_extensions.dart';
import '../../../extensions/penalty_extensions.dart';
import '../../../models/improvisation_model.dart';
import '../../../models/match_model.dart';
import '../../../models/penalty_model.dart';
import '../../../models/point_model.dart';
import '../../../repositories/matches_repository.dart';
import '../../../services/toaster_service.dart';
import 'match_state.dart';

class MatchCubit extends Cubit<MatchState> {
  final MatchesRepository matchesRepository;
  final MatchesCubit matchesCubit;
  final SettingsCubit settingsCubit;
  final ToasterService toasterService;

  MatchCubit({
    required this.matchesRepository,
    required this.matchesCubit,
    required this.settingsCubit,
    required this.toasterService,
  }) : super(const MatchState.initial());

  Future<void> initialize(int id, {int? improvisationId, int? durationIndex}) async {
    final match = await matchesRepository.get(id);
    if (match == null) {
      emit(MatchState.error(settingsCubit.localizer.toasterGenericError));
      return;
    }

    var selectedImprovisationIndex = improvisationId != null ? match.improvisations.indexWhere((i) => i.id == improvisationId) : 0;
    selectedImprovisationIndex = selectedImprovisationIndex >= 0 ? selectedImprovisationIndex : 0;
    emit(MatchState.success(match, selectedImprovisationIndex, durationIndex ?? 0));
    _validatePenalties(match);
  }

  Future<void> edit(MatchModel match) async {
    await state.whenOrNull(
      success: (_, selectedImprovisationIndex, selectedDurationIndex) async {
        emit(MatchState.success(match, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(match);
      },
    );
  }

  Future<void> addImprovisation(ImprovisationModel improvisation, int index) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final improvisations = List<ImprovisationModel>.from(match.improvisations);

        improvisations.insert(index, improvisation);
        final newMatch = match.copyWith(improvisations: improvisations);
        emit(
          MatchState.success(
            newMatch,
            index,
            0,
          ),
        );

        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<void> editImprovisation(ImprovisationModel improvisation, int index) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final improvisations = List<ImprovisationModel>.from(match.improvisations.where((element) => element.id != improvisation.id));

        improvisations.insert(index, improvisation);
        final newMatch = match.copyWith(improvisations: improvisations);
        emit(
          MatchState.success(
            newMatch,
            index,
            0,
          ),
        );

        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<void> removeImprovisation(ImprovisationModel improvisation) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final improvisations = List<ImprovisationModel>.from(match.improvisations.where((element) => element.id != improvisation.id));

        final points = List<PointModel>.from(match.points.where((element) => element.improvisationId != improvisation.id));

        final penalties = List<PenaltyModel>.from(match.penalties.where((element) => element.improvisationId != improvisation.id));

        final newSelectedImprovisationIndex =
            selectedImprovisationIndex >= improvisations.length ? selectedImprovisationIndex - 1 : selectedImprovisationIndex;

        final newMatch = match.copyWith(improvisations: improvisations, points: points, penalties: penalties);

        emit(
          MatchState.success(
            newMatch,
            newSelectedImprovisationIndex,
            0,
          ),
        );

        await matchesCubit.edit(newMatch);
      },
    );
  }

  void changePage(int page) {
    state.whenOrNull(
      success: (match, _, selectedDurationIndex) => emit(
        MatchState.success(
          match,
          page,
          0,
        ),
      ),
    );
  }

  void changeDuration(int durationIndex) {
    state.whenOrNull(
      success: (match, selectedImprovisationIndex, _) => emit(
        MatchState.success(
          match,
          selectedImprovisationIndex,
          durationIndex,
        ),
      ),
    );
  }

  Future<void> setPoint(int improvisationId, int teamId, int value) async {
    await state.whenOrNull(success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
      final points = List<PointModel>.from(match.copyWith().points);
      if (points.any((element) => element.teamId == teamId && element.improvisationId == improvisationId)) {
        final index = points.indexWhere((element) => element.teamId == teamId && element.improvisationId == improvisationId);
        if (value > 0) {
          points[index] = points[index].copyWith(value: value);
        } else {
          points.removeAt(index);
        }
      } else {
        if (value > 0) {
          final nextPointId = points.isNotEmpty ? points.map((e) => e.id).reduce(max) + 1 : 0;
          points.add(PointModel(id: nextPointId, teamId: teamId, improvisationId: improvisationId, value: value));
        }
      }

      final newMatch = match.copyWith(points: points);

      emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
      await matchesCubit.edit(newMatch);
    });
  }

  Future<void> addPenalty(PenaltyModel penalty) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        final nextPenaltyId = penalties.isNotEmpty ? penalties.map((e) => e.id).reduce(max) + 1 : 0;
        penalties.add(penalty.copyWith(id: nextPenaltyId));
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
        _validatePenalty(newMatch, penalty);
      },
    );
  }

  Future<void> editPenalty(PenaltyModel penalty) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        final index = penalties.indexWhere((element) => element.id == penalty.id);
        penalties[index] = penalty;
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
        _validatePenalty(newMatch, penalty);
      },
    );
  }

  Future<void> removePenalty(int penaltyId) async {
    await state.whenOrNull(
      success: (match, selectedImprovisationIndex, selectedDurationIndex) async {
        final penalties = List<PenaltyModel>.from(match.copyWith().penalties);
        penalties.removeWhere((element) => element.id == penaltyId);
        final newMatch = match.copyWith(penalties: penalties);
        emit(MatchState.success(newMatch, selectedImprovisationIndex, selectedDurationIndex));
        await matchesCubit.edit(newMatch);
      },
    );
  }

  Future<bool> exportExcel(MatchModel match) async {
    try {
      final app = excel.Excel.createExcel();

      // Logic START
      app.rename(app.getDefaultSheet()!, match.name);
      final sheet = app.sheets[match.name]!;

      // Match details
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
        excel.TextCellValue(match.name),
        cellStyle: excel.CellStyle(bold: true, fontSize: 20),
      );

      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
        excel.TextCellValue(match.teams.map((e) => e.name).join(' vs ')),
        cellStyle: excel.CellStyle(),
      );

      // Points title
      var pointsTableIndex = 3;
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsTableIndex++),
        excel.TextCellValue(settingsCubit.localizer.points),
        cellStyle: excel.CellStyle(bold: true, fontSize: 17),
      );

      final border = excel.Border(borderStyle: excel.BorderStyle.Thin);

      // Points header
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsTableIndex),
        excel.TextCellValue('${settingsCubit.localizer.teams} ${settingsCubit.localizer.improvisations}'),
        cellStyle: excel.CellStyle(
          bold: true,
          topBorder: border,
          bottomBorder: border,
          leftBorder: border,
          rightBorder: border,
        ),
      );

      match.improvisations.forEachIndexed((index, element) {
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: index + 1, rowIndex: pointsTableIndex),
          excel.IntCellValue(index + 1),
          cellStyle: excel.CellStyle(
            bold: true,
            topBorder: border,
            bottomBorder: border,
            leftBorder: border,
            rightBorder: border,
          ),
        );
      });

      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 1, rowIndex: pointsTableIndex),
        excel.TextCellValue(settingsCubit.localizer.subtotal),
        cellStyle: excel.CellStyle(
          bold: true,
          horizontalAlign: excel.HorizontalAlign.Right,
          topBorder: border,
          bottomBorder: border,
          leftBorder: border,
          rightBorder: border,
        ),
      );

      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 2, rowIndex: pointsTableIndex++),
        excel.TextCellValue(settingsCubit.localizer.total),
        cellStyle: excel.CellStyle(
          bold: true,
          horizontalAlign: excel.HorizontalAlign.Right,
          topBorder: border,
          bottomBorder: border,
          leftBorder: border,
          rightBorder: border,
        ),
      );

      // Points content
      for (final team in match.teams) {
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsTableIndex),
          excel.TextCellValue(team.name),
          cellStyle: excel.CellStyle(
            topBorder: border,
            bottomBorder: border,
            leftBorder: border,
            rightBorder: border,
          ),
        );

        match.improvisations.forEachIndexed((index, element) {
          sheet.updateCell(
            excel.CellIndex.indexByColumnRow(columnIndex: index + 1, rowIndex: pointsTableIndex),
            excel.IntCellValue(match.getImprovisationPointsByTeamId(element.id, team.id)),
            cellStyle: excel.CellStyle(
              topBorder: border,
              bottomBorder: border,
              leftBorder: border,
              rightBorder: border,
            ),
          );
        });

        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 1, rowIndex: pointsTableIndex),
          excel.IntCellValue(match.getSubtotalPointsByTeamId(team.id)),
          cellStyle: excel.CellStyle(
            topBorder: border,
            bottomBorder: border,
            leftBorder: border,
            rightBorder: border,
          ),
        );

        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 2, rowIndex: pointsTableIndex++),
          excel.IntCellValue(match.getTotalPointsByTeamId(team.id)),
          cellStyle: excel.CellStyle(
            bold: true,
            topBorder: border,
            bottomBorder: border,
            leftBorder: border,
            rightBorder: border,
          ),
        );
      }

      // PENALTIES
      var penaltyIndex = pointsTableIndex + 1;

      // Penalties title
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyIndex++),
        excel.TextCellValue(settingsCubit.localizer.penalties),
        cellStyle: excel.CellStyle(bold: true, fontSize: 17),
      );

      if (match.penalties.isEmpty) {
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyIndex),
          excel.TextCellValue(settingsCubit.localizer.noPenalty),
        );
      } else {
        final penaltiesGroupedByImprovisationId = match.getPenaltiesGroupedByImprovisationId();
        for (final entry in penaltiesGroupedByImprovisationId.entries) {
          var isFirst = true;
          for (final penalty in entry.value) {
            final improvisationNumber = match.improvisations.indexWhere((element) => element.id == entry.key) + 1;
            final team = match.teams.firstWhere((element) => element.id == penalty.teamId);
            sheet.updateCell(
              excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyIndex),
              excel.TextCellValue(isFirst ? settingsCubit.localizer.improvisationNumber(improvisationNumber) : ''),
              cellStyle: excel.CellStyle(bold: true),
            );

            sheet.updateCell(
              excel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: penaltyIndex),
              excel.TextCellValue('${team.name} - ${penalty.getPenaltyString(settingsCubit.localizer, match)}'),
              cellStyle: excel.CellStyle(),
            );

            sheet.merge(
              excel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: penaltyIndex),
              excel.CellIndex.indexByColumnRow(columnIndex: sheet.maxColumns - 1, rowIndex: penaltyIndex),
            );

            isFirst = false;
            penaltyIndex++;
          }
        }
      }

      for (var i = 0; i < sheet.maxColumns; i++) {
        sheet.setColumnAutoFit(i);
      }

      // Logic END

      final bytes = app.save();
      if (bytes == null) {
        return false;
      }

      final data = Uint8List.fromList(bytes);
      final fileName = sanitizeFilename('${match.name}.xlsx', replacement: '-');
      final params = SaveFileDialogParams(data: data, fileName: fileName);
      final filePath = await FlutterFileDialog.saveFile(params: params);
      if (filePath != null) {
        toasterService.show(title: settingsCubit.localizer.toasterMatchResultExported);
        return true;
      }
    } catch (exception) {
      toasterService.show(title: settingsCubit.localizer.toasterGenericError, type: ToastificationType.error);
    }

    return false;
  }

  void _validatePenalty(MatchModel match, PenaltyModel penalty) {
    if (match.enableMatchExpulsion && penalty.performerId != null) {
      final penaltyPoints = match.getTotalPenaltyValuesByPerformerId(
        penalty.teamId,
        penalty.performerId!,
      );

      if (penaltyPoints >= match.penaltiesRequiredToExpel) {
        final performer = match.teams.firstWhere((t) => t.id == penalty.teamId).performers.firstWhere((p) => p.id == penalty.performerId);
        toasterService.show(
          title: settingsCubit.localizer.warningExpelPlayerTitle,
          description: settingsCubit.localizer.warningExpelPlayerDescription(performer.name, penaltyPoints),
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
          final penaltyPoints = match.getTotalPenaltyValuesByPerformerId(
            team.id,
            performer.id,
          );

          if (penaltyPoints >= match.penaltiesRequiredToExpel) {
            toasterService.show(
              title: settingsCubit.localizer.warningExpelPlayerTitle,
              description: settingsCubit.localizer.warningExpelPlayerDescription(performer.name, penaltyPoints),
              type: ToastificationType.warning,
              autoClose: false,
            );
          }
        }
      }
    }
  }
}
