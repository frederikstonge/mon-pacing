import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'cubits/matches/matches_cubit.dart';
import 'cubits/pacings/pacings_cubit.dart';
import 'cubits/settings/settings_cubit.dart';
import 'cubits/timer/timer_cubit.dart';
import 'repositories/database_repository.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';

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
          create: (repositoryContext) => PacingsRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
        RepositoryProvider(
          create: (repositoryContext) => MatchesRepository(databaseRepository: repositoryContext.read<DatabaseRepository>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (blocContext) => PacingsCubit(pacingsRepository: blocContext.read<PacingsRepository>())..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => MatchesCubit(repository: blocContext.read<MatchesRepository>())..fetch(),
          ),
          BlocProvider(
            create: (_) => SettingsCubit(),
          ),
          BlocProvider(
            create: (_) => TimerCubit(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}
