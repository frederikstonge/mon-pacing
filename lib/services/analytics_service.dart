import 'package:firebase_analytics/firebase_analytics.dart';

import '../integrations/integration_base.dart';
import '../integrations/match_integration_base.dart';
import '../integrations/pacing_integration_base.dart';
import '../models/match_model.dart';

class AnalyticsService {
  static const exportToExcelEventName = 'EXPORT_TO_EXCEL';
  static const startMatchEventName = 'START_MATCH';
  static const integrationEventName = 'INTEGRATION';

  final FirebaseAnalytics analytics;

  const AnalyticsService({required this.analytics});

  Future<void> logExportToExcel() async {
    await analytics.logEvent(name: AnalyticsService.exportToExcelEventName);
  }

  Future<void> logStartMatch(MatchModel match) async {
    await analytics.logEvent(
      name: AnalyticsService.startMatchEventName,
      parameters: {'enableStatistics': match.enableStatistics.toString()},
    );
  }

  Future<void> logIntegration(IntegrationBase integration) async {
    await analytics.logEvent(
      name: AnalyticsService.integrationEventName,
      parameters: {
        'integrationId': integration.integrationId,
        'pacing': integration is PacingIntegrationBase,
        'match': integration is MatchIntegrationBase,
      },
    );
  }
}
