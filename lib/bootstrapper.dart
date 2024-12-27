import 'package:collection/collection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'cubits/feature_flags/feature_flags_cubit.dart';
import 'cubits/matches/matches_cubit.dart';
import 'cubits/pacings/pacings_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/teams/teams_cubit.dart';
import 'cubits/timer/timer_cubit.dart';
import 'repositories/database_repository.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';
import 'repositories/teams_repository.dart';
import 'services/analytics_service.dart';
import 'services/excel_service.dart';
import 'services/foreground_service.dart';
import 'services/integration_service.dart';
import 'services/toaster_service.dart';

class Bootstrapper extends StatelessWidget {
  final Widget child;
  final List<Object> overrides;

  const Bootstrapper({
    super.key,
    required this.child,
    this.overrides = const [],
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => ToasterService(
              toastification: Toastification(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => ExcelService(),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => IntegrationService(),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => ForegroundService(),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => AnalyticsService(
              analytics: FirebaseAnalytics.instance,
            ),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => DatabaseRepository(),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => PacingsRepository(
              databaseRepository: repositoryContext.read<DatabaseRepository>(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => MatchesRepository(
              databaseRepository: repositoryContext.read<DatabaseRepository>(),
            ),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => _createOrGetOverride(
            () => TeamsRepository(
              databaseRepository: repositoryContext.read<DatabaseRepository>(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => SettingsCubit(),
            ),
          ),
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => PacingsCubit(
                pacingsRepository: blocContext.read<PacingsRepository>(),
                toasterService: blocContext.read<ToasterService>(),
              ),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => MatchesCubit(
                matchesRepository: blocContext.read<MatchesRepository>(),
                toasterService: blocContext.read<ToasterService>(),
                analyticsService: blocContext.read<AnalyticsService>(),
              ),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => TeamsCubit(
                teamsRepository: blocContext.read<TeamsRepository>(),
                toasterService: blocContext.read<ToasterService>(),
              ),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => TimerCubit(
                toasterService: blocContext.read<ToasterService>(),
                settingsCubit: blocContext.read<SettingsCubit>(),
                foregroundService: blocContext.read<ForegroundService>(),
              ),
            )..initialize(),
          ),
          BlocProvider(
            create: (blocContext) => _createOrGetOverride(
              () => FeatureFlagsCubit(
                remoteConfig: FirebaseRemoteConfig.instance,
              ),
            )..init(),
          ),
        ],
        child: child,
      ),
    );
  }

  T _createOrGetOverride<T>(T Function() create) {
    final override = overrides.firstWhereOrNull((o) => o is T);
    if (override != null) {
      return override as T;
    }

    return create();
  }
}
