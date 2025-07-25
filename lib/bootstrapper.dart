import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

import 'app.dart';
import 'cubits/feature_flags/feature_flags_cubit.dart';
import 'cubits/integrations/integrations_cubit.dart';
import 'cubits/matches/matches_cubit.dart';
import 'cubits/onboarding/onboarding_cubit.dart';
import 'cubits/pacings/pacings_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/teams/teams_cubit.dart';
import 'cubits/timer/timer_cubit.dart';
import 'cubits/tutorials/tutorials_cubit.dart';
import 'repositories/database_repository.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';
import 'repositories/tags_repository.dart';
import 'repositories/teams_repository.dart';
import 'services/analytics_service.dart';
import 'services/excel_service.dart';
import 'services/package_info_service.dart';
import 'services/timer_service.dart';
import 'services/toaster_service.dart';

class Bootstrapper extends StatelessWidget {
  const Bootstrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (repositoryContext) => ExcelService()),
        RepositoryProvider(create: (repositoryContext) => TimerService()),
        RepositoryProvider(create: (repositoryContext) => PackageInfoService()),
        RepositoryProvider(create: (repositoryContext) => ToasterService(toastification: Toastification())),
        RepositoryProvider(create: (repositoryContext) => AnalyticsService(analytics: FirebaseAnalytics.instance)),
        RepositoryProvider(
          create: (repositoryContext) => DatabaseRepository(),
          lazy: false,
          dispose: (value) async => await value.close(),
        ),
        RepositoryProvider(
          create: (repositoryContext) =>
              PacingsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) =>
              MatchesRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) =>
              TeamsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) =>
              TagsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (blocContext) => OnboardingCubit()),
          BlocProvider(create: (blocContext) => TutorialsCubit()),
          BlocProvider(create: (blocContext) => SettingsCubit()),
          BlocProvider(
            create: (blocContext) => IntegrationsCubit(remoteConfig: FirebaseRemoteConfig.instance)..initialize(),
            lazy: false,
          ),
          BlocProvider(
            create: (blocContext) => PacingsCubit(
              pacingsRepository: blocContext.read<PacingsRepository>(),
              toasterService: blocContext.read<ToasterService>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => MatchesCubit(
              matchesRepository: blocContext.read<MatchesRepository>(),
              toasterService: blocContext.read<ToasterService>(),
              analyticsService: blocContext.read<AnalyticsService>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => TeamsCubit(
              teamsRepository: blocContext.read<TeamsRepository>(),
              toasterService: blocContext.read<ToasterService>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => TimerCubit(
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
              timerService: blocContext.read<TimerService>(),
            )..initialize(),
          ),
          BlocProvider(
            create: (blocContext) => FeatureFlagsCubit(remoteConfig: FirebaseRemoteConfig.instance)..initialize(),
            lazy: false,
          ),
        ],
        child: const App(),
      ),
    );
  }
}
