import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/timer_model.dart';
import '../models/timer_status.dart';
import 'real_time_match_integration_base.dart';

class ScoreboardussyIntegration implements RealTimeMatchIntegrationBase {
  final Dio client;

  ScoreboardussyIntegration({required this.client});

  @override
  String get integrationId => 'Scoreboardussy';

  @override
  String get featureFlagName => 'FeatureFlag_EnableScoreboardussyIntegration';

  @override
  FutureOr<bool> integrationIsValid(String data) {
    final json = jsonDecode(data);
    return json['url'].toString().contains('/api/interop/mon-pacing');
  }

  @override
  FutureOr<MatchModel> enrichMatch(String scanData, MatchModel match) {
    final json = jsonDecode(scanData);
    final url = json['url'].toString();
    final id = json['id'].toString();
    final token = json['token'].toString();

    final enrichedMatch = match.copyWith(
      integrationId: integrationId,
      integrationEntityId: id,
      integrationAdditionalData: jsonEncode({'url': url, 'token': token}),
    );

    return enrichedMatch;
  }

  /// Called when a match is updated. This includes match details, teams, performers, points, penalties and stars
  @override
  FutureOr<bool> onMatchUpdate(MatchModel match) async {
    final json = jsonDecode(match.integrationAdditionalData!);
    final url = json['url'].toString();
    final id = match.integrationEntityId!;
    final token = json['token'].toString();

    final uri = Uri.parse(url);

    await client.postUri(
      uri.replace(pathSegments: [...uri.pathSegments, 'match']),
      data: {
        'version': 1,
        'matchId': id,
        'match': {
          'id': match.id,
          'name': match.name,
          'teams': match.teams
              .map(
                (team) => {
                  'id': team.id,
                  'name': team.name,
                  'color': '#${team.color.toRadixString(16).substring(2)}',
                  'performers': team.performers
                      .map((performer) => {'id': performer.id, 'name': performer.name})
                      .toList(),
                },
              )
              .toList(),
          'points': match.points
              .map(
                (point) => {
                  'id': point.id,
                  'teamId': point.teamId,
                  'improvisationId': point.improvisationId,
                  'value': point.value,
                },
              )
              .toList(),
          'penalties': match.penalties
              .map(
                (penalty) => {
                  'id': penalty.id,
                  'teamId': penalty.teamId,
                  'improvisationId': penalty.improvisationId,
                  'type': penalty.type,
                  'major': penalty.major,
                  if (penalty.performerId != null) ...{'performerId': penalty.performerId},
                },
              )
              .toList(),
          'stars': match.stars
              .map((star) => {'id': star.id, 'teamId': star.teamId, 'performerId': star.performerId})
              .toList(),
        },
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  // Called when the timer is updated.
  @override
  FutureOr<bool> onTimerUpdate(IntegrationBaseModel integration, TimerModel? timer) async {
    final json = jsonDecode(integration.integrationAdditionalData!);
    final url = json['url'].toString();
    final id = integration.integrationEntityId!;
    final token = json['token'].toString();

    final uri = Uri.parse(url);

    await client.postUri(
      uri.replace(pathSegments: [...uri.pathSegments, 'timer']),
      data: {
        'version': 1,
        'matchId': id,
        'status': switch (timer?.status) {
          TimerStatus.started => 'start',
          TimerStatus.paused => 'pause',
          TimerStatus.stopped => 'stop',
          null => 'stop',
        },
        if (timer != null) ...{
          'totalDuration': Duration(seconds: timer.durationInSeconds).inSeconds,
          'remainingDuration': Duration(milliseconds: timer.remainingMilliseconds).inSeconds,
        },
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }
}
