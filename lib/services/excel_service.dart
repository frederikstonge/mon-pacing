import 'package:collection/collection.dart';
import 'package:excel/excel.dart' as excel;

import '../extensions/match_extensions.dart';
import '../extensions/penalty_extensions.dart';
import '../l10n/app_localizations.dart';
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

    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1),
      excel.TextCellValue(match.teams.map((e) => e.name).join(' vs ')),
      cellStyle: excel.CellStyle(),
    );

    // Points title
    var pointsTableIndex = 3;
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsTableIndex++),
      excel.TextCellValue(localizer.points),
      cellStyle: excel.CellStyle(bold: true, fontSize: 17),
    );

    final border = excel.Border(borderStyle: excel.BorderStyle.Thin);

    // Points header
    sheet.updateCell(
      excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: pointsTableIndex),
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
      excel.CellIndex.indexByColumnRow(columnIndex: match.improvisations.length + 2, rowIndex: pointsTableIndex++),
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
      excel.TextCellValue(localizer.penalties),
      cellStyle: excel.CellStyle(bold: true, fontSize: 17),
    );

    if (match.penalties.isEmpty) {
      sheet.updateCell(
        excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyIndex),
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
            excel.CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: penaltyIndex),
            excel.TextCellValue(isFirst ? localizer.improvisationNumber(improvisationNumber) : ''),
            cellStyle: excel.CellStyle(bold: true),
          );

          sheet.updateCell(
            excel.CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: penaltyIndex),
            excel.TextCellValue('${team.name} - ${penalty.getPenaltyString(localizer, match)}'),
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

    return app.save();
  }
}
