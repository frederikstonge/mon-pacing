import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../models/team_model.dart';
import 'cubits/team_detail_cubit.dart';
import 'team_detail_page_view.dart';

class TeamDetailPageShell extends StatelessWidget {
  final TeamModel? team;
  final bool editMode;
  final FutureOr<void> Function(TeamModel value) onConfirm;

  const TeamDetailPageShell({
    super.key,
    required this.onConfirm,
    required this.editMode,
    this.team,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeamDetailCubit(
        settingsCubit: context.read<SettingsCubit>(),
        onConfirm: onConfirm,
        editMode: editMode,
        team: team,
      )..initialize(),
      child: const TeamDetailPageView(),
    );
  }
}
