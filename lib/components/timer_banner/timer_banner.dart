import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/duration_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import '../../models/timer_model.dart';
import '../../pages/match/cubits/match_cubit.dart';
import '../../router/routes.dart';
import '../buttons/loading_icon_button.dart';

class TimerBanner extends StatelessWidget {
  final TimerModel timer;
  final MatchModel? match;
  final ImprovisationModel? improvisation;
  final int? selectedDurationIndex;

  const TimerBanner({super.key, required this.timer, this.match, this.improvisation, this.selectedDurationIndex});

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarIconBrightness: ThemeData.estimateBrightnessForColor(Theme.of(context).colorScheme.onPrimary),
          statusBarBrightness: ThemeData.estimateBrightnessForColor(Theme.of(context).colorScheme.primary),
        ),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: SafeArea(
            bottom: false,
            child: ListTile(
              leading: Icon(Icons.timer, color: Theme.of(context).colorScheme.onPrimary),
              title: Text(
                timer.notificationTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              subtitle: Text(
                Duration(milliseconds: timer.remainingMilliseconds).toImprovDuration(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
              trailing: LoadingIconButton(
                tooltip: S.of(context).open,
                onPressed: () => _onAction(context, timer),
                icon: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onAction(BuildContext context, TimerModel timer) {
    if (match != null && improvisation != null) {
      if (match!.id == timer.matchId) {
        if (improvisation!.id != timer.improvisationId) {
          final page = match!.improvisations.indexWhere((element) => element.id == timer.improvisationId);
          context.read<MatchCubit>().changePage(page);
        }

        if (selectedDurationIndex != timer.durationIndex) {
          context.read<MatchCubit>().setDurationIndex(timer.durationIndex);
        }
      } else {
        _goToMatch(context, timer);
      }
    } else {
      _goToMatch(context, timer);
    }
  }

  void _goToMatch(BuildContext context, TimerModel timer) {
    context.goNamed(
      Routes.match,
      pathParameters: {'id': timer.matchId.toString()},
      queryParameters: {
        'improvisationId': timer.improvisationId.toString(),
        'durationIndex': timer.durationIndex.toString(),
      },
    );
  }
}
