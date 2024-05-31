import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/matches/matches_cubit.dart';
import '../../cubits/settings/settings_cubit.dart';
import '../../repositories/matches_repository.dart';
import '../../services/analytics_service.dart';
import '../../services/excel_service.dart';
import '../../services/toaster_service.dart';
import 'cubits/match_cubit.dart';
import 'match_page_view.dart';

class MatchPageShell extends StatelessWidget {
  final int id;
  final int? improvisationId;
  final int? durationIndex;

  const MatchPageShell({
    super.key,
    required this.id,
    this.improvisationId,
    this.durationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchCubit(
        matchesRepository: context.read<MatchesRepository>(),
        matchesCubit: context.read<MatchesCubit>(),
        settingsCubit: context.read<SettingsCubit>(),
        toasterService: context.read<ToasterService>(),
        excelService: context.read<ExcelService>(),
        analyticsService: context.read<AnalyticsService>(),
      )..initialize(id, improvisationId: improvisationId, durationIndex: durationIndex),
      child: const MatchPageView(),
    );
  }
}
