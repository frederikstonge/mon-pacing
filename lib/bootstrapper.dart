import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
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
import 'services/toaster_service.dart';

class Bootstrapper extends StatelessWidget {
  const Bootstrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (_) => ToasterService(),
        ),
        RepositoryProvider(
          create: (_) => ExcelService(),
        ),
        RepositoryProvider(
          create: (_) => AnalyticsService(analytics: FirebaseAnalytics.instance),
        ),
        RepositoryProvider(
          create: (repositoryContext) => PacingsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) => MatchesRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) => TeamsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SettingsCubit(),
          ),
          BlocProvider(
            create: (blocContext) => PacingsCubit(
              pacingsRepository: blocContext.read<PacingsRepository>(),
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => MatchesCubit(
              matchesRepository: blocContext.read<MatchesRepository>(),
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
              analyticsService: blocContext.read<AnalyticsService>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => TeamsCubit(
              teamsRepository: blocContext.read<TeamsRepository>(),
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => TimerCubit(
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
            )..initialize(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
