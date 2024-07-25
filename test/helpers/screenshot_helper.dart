import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:isar/isar.dart';

import 'package:mockito/mockito.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/models/team_model.dart';
import 'package:mon_pacing/repositories/database_repository.dart';
import 'package:mon_pacing/services/analytics_service.dart';

import '../mocks/repositories.mocks.dart';
import 'app_wrapper.dart';

Future<void> takeScreenshot({
  required WidgetTester tester,
  required Widget child,
  required String pageName,
  required bool isFinal,
  required Size sizeDp,
  required double density,
  CustomPump? customPump,
}) async {
  final DatabaseRepository databaseRepository = MockDatabaseRepository();

  when(databaseRepository.database).thenReturn(
    Isar.openAsync(
      schemas: [
        PacingModelSchema,
        MatchModelSchema,
        TeamModelSchema,
      ],
      directory: Isar.sqliteInMemory,
      engine: IsarEngine.sqlite,
    ),
  );

  final AnalyticsService analyticsService = MockAnalyticsService();

  await tester.pumpWidgetBuilder(
    getAppWrapper(
      child,
      overrides: [
        databaseRepository,
        analyticsService,
      ],
    ),
  );
  await multiScreenGolden(
    tester,
    pageName,
    customPump: customPump,
    devices: [
      Device(
        name: isFinal ? 'final' : 'screen',
        size: sizeDp,
        textScale: 1,
        devicePixelRatio: density,
      ),
    ],
  );
}
