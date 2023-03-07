import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'repositories/database_repository.dart';
import 'repositories/matches_repository.dart';
import 'repositories/pacings_repository.dart';
import 'widgets/home/home_cubit.dart';
import 'widgets/matches/matches_cubit.dart';
import 'widgets/pacings/pacings_cubit.dart';
import 'widgets/settings/settings_cubit.dart';

class Bootstrapper extends StatelessWidget {
  const Bootstrapper({
    super.key,
  });

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
            create: (blocContext) => PacingsCubit(repository: blocContext.read<PacingsRepository>())..fetch(),
          ),
          BlocProvider(
            create: (blocContext) => MatchesCubit(repository: blocContext.read<MatchesRepository>())..fetch(),
          ),
          BlocProvider(
            create: (_) => SettingsCubit(),
          ),
          BlocProvider(
            create: (_) => HomeCubit(),
          ),
        ],
        child: const App(),
      ),
    );
  }
}