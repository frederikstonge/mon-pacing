import 'package:collection/collection.dart';
import 'package:excel/excel.dart' as excel;

import '../extensions/match_extensions.dart';
import '../extensions/penalty_extensions.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/match_model.dart';

class ExcelService {
  List<int>? exportMatchToExcel(MatchModel match, S localizer) {
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

    var teamRowIndex = 2;
    for (final team in match.teams) {
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: teamRowIndex++),
        excel.TextCellValue(team.name),
        cellStyle: excel.CellStyle(bold: true),
      );

      for (final performer in team.performers) {
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: teamRowIndex++),
          excel.TextCellValue(performer.name),
          cellStyle: excel.CellStyle(),
        );
      }

      teamRowIndex++;
    }

    // Points title
    var pointsRowIndex = teamRowIndex + 1;
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsRowIndex++),
      excel.TextCellValue(localizer.points),
      cellStyle: excel.CellStyle(bold: true, fontSize: 17),
    );

    final border = excel.Border(borderStyle: excel.BorderStyle.Thin);

    // Points header
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsRowIndex),
      excel.TextCellValue('${localizer.teams} ${localizer.improvisations}'),
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
        excel.CellIndex.indexByColumnRow(columnIndex: index + 1, rowIndex: pointsRowIndex),
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
      excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 1, rowIndex: pointsRowIndex),
      excel.TextCellValue(localizer.subtotal),
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
      excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 2, rowIndex: pointsRowIndex++),
      excel.TextCellValue(localizer.total),
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
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsRowIndex),
        excel.TextCellValue(team.name),
        cellStyle: excel.CellStyle(topBorder: border, bottomBorder: border, leftBorder: border, rightBorder: border),
      );

      match.improvisations.forEachIndexed((index, element) {
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: index + 1, rowIndex: pointsRowIndex),
          excel.IntCellValue(match.getImprovisationPointsByTeamId(element.id, team.id)),
          cellStyle: excel.CellStyle(topBorder: border, bottomBorder: border, leftBorder: border, rightBorder: border),
        );
      });

      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 1, rowIndex: pointsRowIndex),
        excel.IntCellValue(match.getSubtotalPointsByTeamId(team.id)),
        cellStyle: excel.CellStyle(topBorder: border, bottomBorder: border, leftBorder: border, rightBorder: border),
      );

      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 2, rowIndex: pointsRowIndex++),
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
    var penaltyRowIndex = pointsRowIndex + 1;

    // Penalties title
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyRowIndex++),
      excel.TextCellValue(localizer.penalties),
      cellStyle: excel.CellStyle(bold: true, fontSize: 17),
    );

    if (match.penalties.isEmpty) {
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyRowIndex),
        excel.TextCellValue(localizer.noPenalty),
      );
    } else {
      final penaltiesGroupedByImprovisationId = match.getPenaltiesGroupedByImprovisationId();
      for (final entry in penaltiesGroupedByImprovisationId.entries) {
        var isFirst = true;
        for (final penalty in entry.value) {
          final improvisationNumber = match.improvisations.indexWhere((element) => element.id == entry.key) + 1;
          final team = match.teams.firstWhere((element) => element.id == penalty.teamId);
          sheet.updateCell(
            excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyRowIndex),
            excel.TextCellValue(isFirst ? localizer.improvisationNumber(order: improvisationNumber) : ''),
            cellStyle: excel.CellStyle(bold: true),
          );

          sheet.updateCell(
            excel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: penaltyRowIndex),
            excel.TextCellValue('${team.name} - ${penalty.getPenaltyString(localizer, match)}'),
            cellStyle: excel.CellStyle(),
          );

          sheet.merge(
            excel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: penaltyRowIndex),
            excel.CellIndex.indexByColumnRow(columnIndex: sheet.maxColumns - 1, rowIndex: penaltyRowIndex),
          );

          isFirst = false;
          penaltyRowIndex++;
        }
      }
    }

    // STARS
    var starsRowIndex = penaltyRowIndex + 1;

    // Stars title
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: starsRowIndex++),
      excel.TextCellValue(localizer.stars),
      cellStyle: excel.CellStyle(bold: true, fontSize: 17),
    );

    if (match.penalties.isEmpty) {
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: starsRowIndex),
        excel.TextCellValue(localizer.noStar),
      );
    } else {
      for (final star in match.stars) {
        final team = match.teams.firstWhere((element) => element.id == star.teamId);
        final performer = team.performers.firstWhere((element) => element.id == star.performerId);
        sheet.updateCell(
          excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: starsRowIndex),
          excel.TextCellValue('${team.name} - ${performer.name}'),
        );

        starsRowIndex++;
      }
    }

    for (var i = 0; i < sheet.maxColumns - 1; i++) {
      sheet.setColumnAutoFit(i);
    }

    // Logic END

    return app.save();
  }
}
