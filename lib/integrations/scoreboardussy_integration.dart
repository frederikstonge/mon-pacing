import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/timer_model.dart';
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

  @override
  FutureOr<bool> onMatchUpdate(MatchModel? oldMatch, MatchModel newMatch) async {
    final json = jsonDecode(newMatch.integrationAdditionalData!);
    final url = json['url'].toString();
    final id = newMatch.integrationEntityId!;
    final token = json['token'].toString();

    await planImport(url, id, token, newMatch);

    return true;
  }

  @override
  FutureOr<bool> onTimerUpdate(IntegrationBaseModel integration, TimerModel? oldTimer, TimerModel? newTimer) async {
    final json = jsonDecode(integration.integrationAdditionalData!);
    final url = json['url'].toString();
    final id = integration.integrationEntityId!;
    final token = json['token'].toString();

    await timerControl(url, id, token, 'timer', action: 'start', durationInSeconds: newTimer?.durationInSeconds);

    return true;
  }

  Future<bool> planImport(String baseUrl, String entityId, String token, MatchModel match) async {
    final planUri = Uri.parse(baseUrl);
    planUri.pathSegments.add('plan');
    await client.postUri(
      planUri,
      data: {
        'version': 1,
        'matchId': entityId,
        'teams': [
          {'id': 'A', 'name': 'Team A', 'color': '#ff3333'},
          {'id': 'B', 'name': 'Team B', 'color': '#3333ff'},
        ],
        'rounds': [
          {
            'id': 'r1',
            'order': 1,
            'category': 'Open',
            'theme': 'Welcome scene',
            'minutes': 2,
            'seconds': 0,
            'type': 'set', // optional; if omitted, derived from category map
            'mixed': false,
          },
        ],
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  /// type: timer -> start | stop | set (with durationSec)
  ///       pause
  ///       resume
  Future<bool> timerControl(
    String baseUrl,
    String entityId,
    String token,
    String type, {
    String? action,
    int? durationInSeconds,
  }) async {
    final eventUri = Uri.parse(baseUrl);
    eventUri.pathSegments.add('event');

    await client.postUri(
      eventUri,
      data: {
        'version': 1,
        'matchId': entityId,
        'type': type,
        if (action != null) ...{
          'payload': {
            'action': action,
            if (durationInSeconds != null) ...{'durationSec': durationInSeconds},
          },
        },
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  Future<bool> roundLifeCycle(
    String baseUrl,
    String entityId,
    String token,
    String type, {
    String? improvisationId,
  }) async {
    final eventUri = Uri.parse(baseUrl);
    eventUri.pathSegments.add('event');

    await client.postUri(
      eventUri,
      data: {
        'version': 1,
        'matchId': entityId,
        'type': type,
        'payload': {
          if (improvisationId != null) ...{'roundId': improvisationId},
        },
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  Future<bool> score(String baseUrl, String entityId, String token, String team, int points) async {
    final eventUri = Uri.parse(baseUrl);
    eventUri.pathSegments.add('event');

    await client.postUri(
      eventUri,
      data: {
        'version': 1,
        'matchId': entityId,
        'type': 'points',
        'payload': {'team': team, 'points': points},
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  Future<bool> penalty(String baseUrl, String entityId, String token, String team, String kind) async {
    final eventUri = Uri.parse(baseUrl);
    eventUri.pathSegments.add('event');

    await client.postUri(
      eventUri,
      data: {
        'version': 1,
        'matchId': entityId,
        'type': 'penalty',
        'payload': {'team': team, 'kind': kind},
      },
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }
}
