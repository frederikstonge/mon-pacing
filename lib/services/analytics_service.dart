import 'package:firebase_analytics/firebase_analytics.dart';

import '../models/match_model.dart';

class AnalyticsService {
  static const exportToExcelEventName = 'EXPORT_TO_EXCEL';
  static const startMatchEventName = 'START_MATCH';

  final FirebaseAnalytics analytics;

  const AnalyticsService({required this.analytics});

  Future<void> logExportToExcel() async {
    await analytics.logEvent(
      name: AnalyticsService.exportToExcelEventName,
    );
  }

  Future<void> logStartMatch(MatchModel match) async {
    await analytics.logEvent(
      name: AnalyticsService.startMatchEventName,
      parameters: {
        'enableStatistics': match.enableStatistics,
      },
    );
  }
}
