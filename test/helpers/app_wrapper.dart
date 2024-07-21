import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:mon_pacing/bootstrapper.dart';
import 'package:mon_pacing/models/match_model.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/models/team_model.dart';
import 'package:mon_pacing/repositories/database_repository.dart';
import 'package:mon_pacing/services/analytics_service.dart';

import 'app_wrapper.mocks.dart';

@GenerateNiceMocks([MockSpec<DatabaseRepository>()])
@GenerateNiceMocks([MockSpec<AnalyticsService>()])
Widget getAppWrapper() {
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

  return Bootstrapper(
    overrides: [
      databaseRepository,
      analyticsService,
    ],
  );
}
