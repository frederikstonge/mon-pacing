// ============================================================================
// Intégration AppImpro pour Mon Pacing
// ----------------------------------------------------------------------------
// À placer dans lib/integrations/appimpro_integration.dart.
//
// Reprend fidèlement le patron de ScoreboardussyIntegration (même
// interface RealTimeMatchIntegrationBase, même convention de QR
// {url, id, token}, même en-tête d'authentification Bearer) — la
// seule vraie différence est le contenu du payload envoyé dans
// onMatchUpdate : AppImpro a besoin des improvisations elles-mêmes
// (thème, catégorie, durée, nature) pour remplir sa file de spectacle
// AVANT le début du match, pas seulement du score en temps réel.
//
// Deux points à valider avec l'équipe AppImpro avant de
// merger :
//   1. integrationIsValid ci-dessous distingue AppImpro de
//      Scoreboardussy en vérifiant aussi le nom d'hôte
//      (appimpro.com), pas seulement le chemin générique
//      "/api/interop/mon-pacing" -- sinon les deux intégrations
//      matcheraient le même QR. À ajuster si Mon Pacing a déjà un
//      autre mécanisme de désambiguïsation entre intégrations.
//   2. Les noms des champs de ImprovisationModel utilisés plus bas
//      (type, category, theme, durationsInSeconds, performers, notes)
//      sont repris de Pacing-Test.json -- à corriger si le modèle réel
//      a changé depuis.
// ============================================================================

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/integration_base_model.dart';
import '../models/match_model.dart';
import '../models/timer_model.dart';
import '../models/timer_status.dart';
import 'real_time_match_integration_base.dart';

class AppImproIntegration implements RealTimeMatchIntegrationBase {
  final Dio client;

  AppImproIntegration({required this.client});

  @override
  String get integrationId => 'AppImpro';

  @override
  String get featureFlagName => 'FeatureFlag_EnableAppImproIntegration';

  @override
  FutureOr<bool> integrationIsValid(String data) {
    final json = jsonDecode(data);
    final url = Uri.tryParse(json['url'].toString());
    if (url == null) return false;

    // Vérifie le chemin ET l'hôte, pour éviter toute collision avec
    // une autre intégration qui réutiliserait le même chemin générique
    // "/api/interop/mon-pacing" (c'est le cas de Scoreboardussy).
    return url.host.contains('appimpro') && json['url'].toString().contains('/api/interop/mon-pacing');
  }

  @override
  FutureOr<MatchModel> enrichMatch(String scanData, MatchModel match) {
    final json = jsonDecode(scanData);
    final url = json['url'].toString();
    final id = json['id'].toString();
    final token = json['token'].toString();

    return match.copyWith(
      integrationId: integrationId,
      integrationEntityId: id,
      integrationAdditionalData: jsonEncode({'url': url, 'token': token}),
    );
  }

  /// Appelé à chaque changement du match. Contrairement à
  /// Scoreboardussy (qui n'a besoin que du score en direct), AppImpro
  /// a besoin des improvisations elles-mêmes -- c'est ce qui remplit
  /// sa file de spectacle. Le reste (équipes/points/pénalités/étoiles)
  /// est envoyé en prime, pour une éventuelle synchronisation du score
  /// plus tard, mais n'est pas exploité pour l'instant côté AppImpro.
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
          'improvisations': match.improvisations
              .map(
                (improv) => {
                  'id': improv.id,
                  'type': improv.type.name,
                  'category': improv.category,
                  'theme': improv.theme,
                  'durationsInSeconds': improv.durationsInSeconds,
                  'performers': improv.performers,
                  'notes': improv.notes,
                },
              )
              .toList(),
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

  // Pas encore exploité côté AppImpro, mais gardé pour respecter
  // l'interface et permettre une synchronisation du chrono plus tard.
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
