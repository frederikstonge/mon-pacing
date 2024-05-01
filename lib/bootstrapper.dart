import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'cubits/matches/matches_cubit.dart';
import 'cubits/pacings/pacings_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/timer/timer_cubit.dart';
import 'repositories/database_repository.dart';
import 'repositories/legacy_database_repository.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';
import 'services/toaster_service.dart';

class Bootstrapper extends StatelessWidget {
  const Bootstrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => LegacyDatabaseRepository(),
        ),
        RepositoryProvider(
          create: (_) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (_) => ToasterService(),
        ),
        RepositoryProvider(
          create: (repositoryContext) => PacingsRepository(
            legacyDatabaseRepository: repositoryContext.read<LegacyDatabaseRepository>(),
            databaseRepository: repositoryContext.read<DatabaseRepository>(),
          ),
        ),
        RepositoryProvider(
          create: (repositoryContext) => MatchesRepository(
            legacyDatabaseRepository: repositoryContext.read<LegacyDatabaseRepository>(),
            databaseRepository: repositoryContext.read<DatabaseRepository>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => SettingsCubit()..intializeLocalizer(),
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
              repository: blocContext.read<MatchesRepository>(),
              toasterService: blocContext.read<ToasterService>(),
              settingsCubit: blocContext.read<SettingsCubit>(),
            )..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => TimerCubit(settingsCubit: blocContext.read<SettingsCubit>())..initialize(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
