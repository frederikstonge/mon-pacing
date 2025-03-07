import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

import '../extensions/color_extensions.dart';
import '../extensions/match_extensions.dart';
import '../l10n/localizer.dart';
import '../models/constants.dart';
import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/performer_model.dart';
import '../models/team_model.dart';
import 'match_integration_base.dart';

class CitrusIntegration implements MatchIntegrationBase {
  static const int MinNumberOfImprovisations = 12;
  static const int MaxNumberOfImprovisations = 13;

  final Dio client;

  const CitrusIntegration({required this.client});

  @override
  String get integrationId => 'Citrus';

  @override
  bool integrationIsValid(String data) {
    final url = Uri.tryParse(data);
    if (url == null) {
      return false;
    }

    return url.pathSegments.first.toLowerCase() == integrationId.toLowerCase();
  }

  @override
  Future<MatchModel> getMatch(String data, PacingModel pacing) async {
    if (pacing.improvisations.length < MinNumberOfImprovisations) {
      throw Exception(
        Localizer.current.integrationPacingMustHaveAtLeastXImprovisations(count: MinNumberOfImprovisations),
      );
    }

    if (pacing.improvisations.length > MaxNumberOfImprovisations) {
      throw Exception(
        Localizer.current.integrationPacingMustHaveAtMostXImprovisations(count: MaxNumberOfImprovisations),
      );
    }

    final url = Uri.parse(data);
    final response = await client.get<String>(url.toString());
    final document = parse(response.data);

    final matchNameSelector = document.querySelector('.teamBoard');
    if (matchNameSelector == null) {
      throw Exception();
    }

    final matchName = _sanitize(matchNameSelector.text);

    final matchId = _extractMatchID(document);
    final csrfToken = _extractCsrfToken(document);

    final team1Logo = document.querySelectorAll('.logoBoard img')[0].attributes['src'];
    final team2Logo = document.querySelectorAll('.logoBoard img')[1].attributes['src'];

    final team1LogoUrl = Uri(scheme: url.scheme, host: url.host, path: team1Logo);
    final team2LogoUrl = Uri(scheme: url.scheme, host: url.host, path: team2Logo);

    var team1Color = await _getTeamColor(team1LogoUrl);
    var team2Color = await _getTeamColor(team2LogoUrl);

    if (team1Color == team2Color) {
      team1Color = _getRandomTeamColor();
      team2Color = _getRandomTeamColor(except: team1Color);
    }

    final penaltyTypes =
        document
            .querySelectorAll('form#addPunForm select#pun option')
            .map((e) => e.text)
            .where((e) => e.isNotEmpty)
            .toList();

    var performerId = 0;
    return MatchModel(
      id: 0,
      name: matchName,
      createdDate: null,
      modifiedDate: null,
      tags: [integrationId],
      teams: [
        _extractTeam(document, 1, '#alignement1', team1Color!, () => performerId++),
        _extractTeam(document, 2, '#alignement2', team2Color!, () => performerId++),
      ],
      improvisations: List.from(pacing.improvisations),
      penalties: [],
      points: [],
      enableStatistics: true,
      enablePenaltiesImpactPoints: true,
      penaltiesImpactType: PenaltiesImpactType.addPoints,
      penaltiesRequiredToImpactPoints: 2,
      enableMatchExpulsion: true,
      penaltiesRequiredToExpel: 3,
      integrationId: integrationId,
      integrationEntityId: matchId,
      integrationRestrictMaximumPointPerImprovisation: 1,
      integrationMinNumberOfImprovisations: MinNumberOfImprovisations,
      integrationMaxNumberOfImprovisations: MaxNumberOfImprovisations,
      integrationPenaltyTypes: penaltyTypes.isNotEmpty ? penaltyTypes : null,
      integrationAdditionalData: jsonEncode({'csrfToken': csrfToken, 'exportUrl': url.toString()}),
    );
  }

  @override
  Future<bool> exportMatch(MatchModel match) async {
    final exportData = jsonDecode(match.integrationAdditionalData!);
    final urlString = exportData['exportUrl'];
    final url = Uri.parse(urlString);
    final newUrl = Uri.https(url.authority, '/Citrus/SaveToDB/');
    final dataString = _generateExportData(match);

    final response = await client.post(
      newUrl.toString(),
      data: jsonEncode({
        'userID': 'MonPacing',
        'matchID': int.parse(match.integrationEntityId!),
        'dataString': dataString,
      }),
      options: Options(
        headers: {
          'X-Csrftoken': exportData['csrfToken'],
          'Referer': urlString,
          'Content-Type': 'application/json',
          'Cookie': 'csrftoken=${exportData['csrfToken']}',
          'Origin': url.origin,
        },
      ),
    );

    final isSuccessful = response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300;
    if (isSuccessful) {
      await launchUrl(url);
    }

    return isSuccessful;
  }

  static String _sanitize(String input) {
    return input
        .replaceAll('\r\n', ' ')
        .replaceAll('\n', ' ')
        .replaceAll('\r', ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  static Future<int?> _getTeamColor(Uri imageUrl) async {
    try {
      final colorScheme = await ColorScheme.fromImageProvider(provider: Image.network(imageUrl.toString()).image);
      return colorScheme.primary.getIntvalue;
    } catch (_) {}

    return null;
  }

  static int _getRandomTeamColor({int? except}) {
    final random = Random();
    final colorList = Constants.colors.where((c) => c.getIntvalue != except).toList();
    return colorList.elementAt(random.nextInt(colorList.length)).getIntvalue;
  }

  static String? _extractMatchID(Document document) {
    final scriptTagSelector = document.querySelectorAll('script');
    for (final scriptTag in scriptTagSelector) {
      final regex = RegExp(r'let matchID = (.*?);');
      final match = regex.firstMatch(scriptTag.innerHtml);
      if (match?.group(1) != null) {
        return match?.group(1);
      }
    }

    return null;
  }

  static String _extractCsrfToken(Document document) {
    return document.head!.querySelector('meta[name=csrf-token]')!.attributes['content'].toString();
  }

  static TeamModel _extractTeam(
    Document document,
    int teamId,
    String selector,
    int color,
    int Function() getPerformerId,
  ) {
    final teamSelector = document.querySelector(selector);
    if (teamSelector == null) {
      throw Exception();
    }

    final teamName = _sanitize(teamSelector.getElementsByTagName('h3').map((e) => e.text).join(' - '));

    final performers =
        teamSelector.querySelectorAll('.player').map((element) {
          final data = element.getElementsByTagName('p');
          final performerName = _sanitize(data.last.text);
          final metadata = {
            'role': _sanitize(data[0].text),
            'number': _sanitize(data[1].text),
            'pronoun': _sanitize(data[2].text),
            'name': _sanitize(data[3].text),
          };
          return PerformerModel(
            name: performerName,
            id: getPerformerId(),
            integrationAdditionalData: jsonEncode(metadata),
          );
        }).toList();

    return TeamModel(
      id: teamId,
      createdDate: null,
      modifiedDate: null,
      name: teamName,
      color: color,
      performers: performers,
      integrationEntityId: 'team$teamId',
    );
  }

  static String _generateExportData(MatchModel match) {
    return '''[${match.teams.map(_generateTeamData).join(',')},${_generateImprovisationsData(match)},${_generatePenaltiesData(match)},[],${_generatePointsData(match)}]''';
  }

  static String _generateTeamData(TeamModel team) {
    return '[${team.performers.map(_generatePerformerData).join(',')}]';
  }

  static String _generatePerformerData(PerformerModel performer) {
    final jsonData = jsonDecode(performer.integrationAdditionalData!);
    return '[\'${jsonData['role']}\',\'${jsonData['number']}\',\'${jsonData['pronoun']}\',\'${jsonData['name']}\']';
  }

  static String _generateImprovisationsData(MatchModel match) {
    return '[${match.improvisations.map((e) {
      final points = match.points.where((point) => point.improvisationId == e.id);
      var teamWhoWon = '';
      if (points.isEmpty) {
        teamWhoWon = '';
      } else if (points.length == 2 && points.first.value == points.last.value) {
        teamWhoWon = 'both';
      } else {
        final mostPoints = match.points.reduce((current, next) => current.value > next.value ? current : next);
        teamWhoWon = match.teams.firstWhere((team) => team.id == mostPoints.teamId).integrationEntityId!;
      }

      return '[\'${e.theme}\',\'$teamWhoWon\']';
    }).join(',')}]';
  }

  static String _generatePenaltiesData(MatchModel match) {
    return '[${match.penalties.map((e) {
      final team = match.teams.firstWhere((team) => team.id == e.teamId);
      return '[\'${team.name.split(' - ').first}\',\'${e.type}\']';
    }).join(',')}]';
  }

  static String _generatePointsData(MatchModel match) {
    return '[[${match.teams.map((t) {
      return match.getSubtotalPointsByTeamId(t.id);
    }).join(',')}],[${match.teams.map((t) {
      return match.getTotalPenaltyValuesByTeamId(t.id);
    }).join(',')}],[${match.teams.map((t) {
      return match.getTotalPointsByTeamId(t.id);
    }).join(',')}]]';
  }
}
