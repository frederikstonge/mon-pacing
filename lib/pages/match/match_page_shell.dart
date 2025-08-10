import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/integrations/integrations_cubit.dart';
import '../../cubits/matches/matches_cubit.dart';
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

  const MatchPageShell({super.key, required this.id, this.improvisationId, this.durationIndex});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchCubit(
        matchesRepository: context.read<MatchesRepository>(),
        matchesCubit: context.read<MatchesCubit>(),
        toasterService: context.read<ToasterService>(),
        excelService: context.read<ExcelService>(),
        analyticsService: context.read<AnalyticsService>(),
        integrationsCubit: context.read<IntegrationsCubit>(),
      )..initialize(id, improvisationId: improvisationId, durationIndex: durationIndex),
      child: const MatchPageView(),
    );
  }
}
