import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import 'cubits/match_improvisation_cubit.dart';
import 'match_improvisation_view.dart';

class MatchImprovisationShell extends StatelessWidget {
  final ImprovisationModel? improvisation;
  final MatchModel match;
  final FutureOr<void> Function(ImprovisationModel improvisation, int index) onConfirm;

  const MatchImprovisationShell({super.key, this.improvisation, required this.onConfirm, required this.match});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MatchImprovisationCubit(
            improvisation: improvisation,
            match: match,
            settingsCubit: context.read<SettingsCubit>(),
            onConfirm: onConfirm,
          ),
      child: const MatchImprovisationView(),
    );
  }
}
