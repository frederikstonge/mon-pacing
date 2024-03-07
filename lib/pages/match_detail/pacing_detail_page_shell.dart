import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings/settings_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../../models/match_model.dart';
import '../../models/pacing_model.dart';
import 'cubits/match_detail_cubit.dart';
import 'match_detail_page_view.dart';

class MatchDetailPageShell extends StatelessWidget {
  final MatchModel? match;
  final PacingModel? pacing;
  final FutureOr<void> Function(MatchModel value) onConfirm;

  const MatchDetailPageShell({
    super.key,
    required this.onConfirm,
    this.match,
    this.pacing,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchDetailCubit(
        settingsCubit: context.read<SettingsCubit>(),
        s: S.of(context),
        onConfirm: onConfirm,
        pacing: pacing,
        match: match,
      ),
      child: const MatchDetailPageView(),
    );
  }
}
