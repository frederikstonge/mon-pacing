// ============================================================================
// AppImpro integration (https://appimpro.com)
// ----------------------------------------------------------------------------
// Two distinct ways of working with AppImpro:
//
// 1. LINK (live): the referee scans the "Lier Mon Pacing" QR code shown by
//    the AppImpro MC. The QR holds {"url", "id", "token"}.
//      - getMatch: reads the match from AppImpro (name, teams, performers,
//        penalty rules) with GET {url}/match?matchId={id}. The match is then
//        created directly, without the "Start match" form.
//      - onMatchUpdate / onTimerUpdate: POST {url}/match and {url}/timer,
//        "Authorization: Bearer {token}". AppImpro fills its show queue from
//        the improvisations.
//    Roles: the referee (Mon Pacing) owns the pacing, timers, penalties and
//    points; the AppImpro MC owns what the audience sees (cards, votes,
//    screens). Data only flows from Mon Pacing to AppImpro.
//
// 2. SEND (one-time copy): "Send to AppImpro" in the pacing menu
//    (sendPacing). The pacing is dropped on the AppImpro server, which
//    returns a 4-digit code valid for 10 minutes. The referee gives the code
//    to the MC, who imports the pacing in AppImpro. No follow-up.
// ============================================================================

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../models/improvisation_model.dart';
import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/pacing_model.dart';
import '../models/penalties_impact_type.dart';
import '../models/performer_model.dart';
import '../models/team_model.dart';
import '../models/timer_model.dart';
import 'match_integration_base.dart';
import 'real_time_match_integration_base.dart';

class AppImproIntegration implements MatchIntegrationBase, RealTimeMatchIntegrationBase {
  /// Base address of the AppImpro interop API (also used by "Send to AppImpro").
  static const String baseUrl = 'https://appimpro.com/api/interop/mon-pacing';

  /// Anonymous identifier for this app session, used by AppImpro only to
  /// rate-limit "Send to AppImpro" (one send per minute).
  static final String _deviceId = Uuid().v4();

  final Dio client;

  AppImproIntegration({required this.client});

  @override
  String get integrationId => 'AppImpro';

  @override
  FutureOr<bool> integrationIsValid(String data) {
    try {
      final json = jsonDecode(data);
      if (json is! Map) return false;
      final url = json['url'].toString();
      return url.contains(baseUrl);
    } catch (_) {
      return false;
    }
  }

  @override
  FutureOr<MatchModel> enrichMatch(String scanData, MatchModel match) {
    return match;
  }

  /// Called on every match change. AppImpro uses the improvisations to fill
  /// its show queue; it ignores the update when the pacing did not change.
  @override
  FutureOr<bool> onMatchUpdate(MatchModel match) async {
    final json = jsonDecode(match.integrationAdditionalData!);
    final url = json['url'].toString();
    final token = json['token'].toString();

    final uri = Uri.parse(url);

    await client.postUri(
      uri.replace(pathSegments: [...uri.pathSegments, 'match']),
      data: match.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  // Not used by AppImpro yet, kept for the interface and a future timer sync.
  @override
  FutureOr<bool> onTimerUpdate(IntegrationBaseModel integration, TimerModel? timer) async {
    final json = jsonDecode(integration.integrationAdditionalData!);
    final url = json['url'].toString();
    final token = json['token'].toString();

    final uri = Uri.parse(url);

    await client.postUri(
      uri.replace(pathSegments: [...uri.pathSegments, 'timer']),
      data: timer?.toJson(),
      options: Options(headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'}),
    );

    return true;
  }

  /// Called after scanning the QR code and selecting the pacing: reads the
  /// show from AppImpro, so the referee does not retype anything.
  ///
  /// Response of GET {url}/match?matchId={id}:
  /// ```json
  /// {
  ///   "name": "PLIC - Bleu VS Rouge - 12 octobre 2026",
  ///   "teams": [{"id": "<AppImpro team id>", "name": "Bleu", "color": 4280391411,
  ///              "performers": [{"id": "<AppImpro user id>", "name": "Stage name",
  ///                              "number": "7", "captain": true}]}],
  ///   "penaltyTypes": null,
  ///   "rules": {"maximumPointsPerImprovisation": 1, "enablePenaltiesImpactPoints": true,
  ///             "penaltiesImpactType": "addPoints", "penaltiesRequiredToImpactPoints": 3,
  ///             "enableMatchExpulsion": true, "penaltiesRequiredToExpel": 3},
  ///   "plannedImprovisations": 10
  /// }
  /// ```
  @override
  FutureOr<MatchModel> getMatch(String scanData, PacingModel pacing) async {
    final json = jsonDecode(scanData);
    final id = json['id'].toString();
    final url = json['url'].toString();
    final token = json['token'].toString();

    // Send the pacing information to AppImpro before fetching the match details.
    final responsePacing = await _sendPacing(pacing, id, token);
    final code = responsePacing.code;
    final expiresIn = responsePacing.expiresInMinutes;

    final responseMatch = await _sendData<Map<String, dynamic>>(
      'GET',
      ['match'],
      token,
      queryParameters: {'matchId': id},
    );

    if (responseMatch == null) {
      throw Exception('Failed to fetch match details from AppImpro.');
    }

    final rules = (responseMatch['rules'] as Map?)?.cast<String, dynamic>() ?? const <String, dynamic>{};
    final penaltyTypes = (responseMatch['penaltyTypes'] as List?)?.map((e) => e.toString()).toList();

    // Negative ids: like the pacing improvisations, new entities are created.
    var performerId = 0;
    final teamsData = (responseMatch['teams'] as List?) ?? const [];
    final teams = <TeamModel>[
      for (var i = 0; i < teamsData.length; i++)
        _team(Map<String, dynamic>.from(teamsData[i] as Map), -(i + 1), () => -(++performerId)),
    ];

    final pacingName = pacing.name.trim();
    final appImproName = (responseMatch['name'] ?? '').toString().trim();
    final integrationAdditionalData = jsonEncode({'url': url, 'token': token, 'code': code, 'expiresIn': expiresIn});

    return MatchModel(
      id: 0,
      name: appImproName.isNotEmpty ? appImproName : pacingName,
      createdDate: null,
      modifiedDate: null,
      teams: teams,
      improvisations: List<ImprovisationModel>.from(pacing.improvisations.map((e) => e.copyWith(id: -e.id.abs()))),
      penalties: [],
      points: [],
      // Statistics need performers in every team.
      enableStatistics: teams.isNotEmpty && teams.every((t) => t.performers.isNotEmpty),
      enablePenaltiesImpactPoints: rules['enablePenaltiesImpactPoints'] as bool? ?? true,
      penaltiesImpactType: rules['penaltiesImpactType'] == 'substractPoints'
          ? PenaltiesImpactType.substractPoints
          : PenaltiesImpactType.addPoints,
      penaltiesRequiredToImpactPoints: (rules['penaltiesRequiredToImpactPoints'] as num?)?.toInt() ?? 3,
      enableMatchExpulsion: rules['enableMatchExpulsion'] as bool? ?? true,
      penaltiesRequiredToExpel: (rules['penaltiesRequiredToExpel'] as num?)?.toInt() ?? 3,
      integrationId: integrationId,
      integrationEntityId: id,
      integrationAdditionalData: integrationAdditionalData,
      maximumPointsPerImprovisation: (rules['maximumPointsPerImprovisation'] as num?)?.toInt() ?? 1,
      minNumberOfImprovisations: null,
      maxNumberOfImprovisations: null,
      penaltyTypes: penaltyTypes != null && penaltyTypes.isNotEmpty ? penaltyTypes : null,
    );
  }

  TeamModel _team(Map<String, dynamic> data, int teamId, int Function() nextPerformerId) {
    final performers = ((data['performers'] as List?) ?? const [])
        .map((p) => Map<String, dynamic>.from(p as Map))
        .where((p) => (p['name'] ?? '').toString().trim().isNotEmpty)
        .map(
          (p) => PerformerModel(
            id: nextPerformerId(),
            name: p['name'].toString().trim(),
            integrationEntityId: p['id']?.toString(),
          ),
        )
        .toList();

    return TeamModel(
      id: teamId,
      createdDate: null,
      modifiedDate: null,
      name: (data['name'] ?? '').toString(),
      color: (data['color'] as num?)?.toInt() ?? (teamId == -1 ? 0xFF2FA5E0 : 0xFFE74C3C),
      performers: performers,
      integrationEntityId: data['id']?.toString(),
    );
  }

  @override
  FutureOr<bool> exportMatch(MatchModel match) {
    // Will be called from a button in the match summary to export the final match statistics.
    throw UnimplementedError();
  }

  /// "Send to AppImpro": drops the pacing on the AppImpro server and returns
  /// the 4-digit code to give to the MC (valid [AppImproSendResult.expiresInMinutes]).
  Future<AppImproSendResult> _sendPacing(PacingModel pacing, String matchId, String token) async {
    // Send the pacing information to AppImpro before fetching the match details.
    final response = await _sendData<Map<String, dynamic>>(
      'POST',
      ['pacing'],
      token,
      queryParameters: {'matchId': matchId},
      data: pacing.toString(),
    );

    if (response == null) {
      throw Exception('Failed to send pacing data to AppImpro.');
    }

    return AppImproSendResult(
      code: response['code'].toString(),
      expiresInMinutes: (response['expiresEnMinutes'] as num?)?.toInt() ?? 10,
    );
  }

  Future<T?> _sendData<T>(
    String method,
    List<String> pathSegments,
    String token, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    final uri = Uri.parse(baseUrl);
    final response = await client.requestUri(
      uri.replace(pathSegments: [...uri.pathSegments, ...pathSegments], queryParameters: queryParameters),
      data: data,
      options: Options(
        method: method,
        headers: {
          'Content-Type': 'application/json',
          'X-Device-Id': _deviceId,
          ...?headers,
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data as T?;
  }
}

class AppImproSendResult {
  final String code;
  final int expiresInMinutes;

  const AppImproSendResult({required this.code, required this.expiresInMinutes});
}
