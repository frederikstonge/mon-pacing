import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import '../../pages/match/cubits/match_cubit.dart';
import '../../router/routes.dart';
import '../../services/foreground_service/timer_status_model.dart';

class TimerBanner extends StatelessWidget {
  final MatchModel? match;
  final ImprovisationModel? improvisation;
  final int? selectedDurationIndex;

  const TimerBanner({
    super.key,
    this.match,
    this.improvisation,
    this.selectedDurationIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.timerStatus != null) ...[
              MaterialBanner(
                backgroundColor: Theme.of(context).colorScheme.primary,
                content: Text(
                  '${state.timerStatus!.notificationTitle} - ${Duration(milliseconds: state.timerStatus!.remainingMilliseconds).toImprovDuration()}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                ),
                actions: [
                  IconButton(
                    onPressed: () => _onAction(context, state.timerStatus!),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  )
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _onAction(BuildContext context, TimerStatusModel timerStatus) {
    if (match != null && improvisation != null && selectedDurationIndex != null) {
      if (match!.id == timerStatus.matchId) {
        if (improvisation!.id != timerStatus.improvisationId) {
          final page = match!.improvisations.indexWhere((element) => element.id == timerStatus.improvisationId);
          context.read<MatchCubit>().changePage(page);
        }

        if (selectedDurationIndex != timerStatus.durationIndex) {
          context.read<MatchCubit>().changeDuration(timerStatus.durationIndex);
        }
      } else {
        _goToMatch(context, timerStatus);
      }
    } else {
      _goToMatch(context, timerStatus);
    }
  }

  void _goToMatch(BuildContext context, TimerStatusModel timerStatus) {
    context.goNamed(
      Routes.match,
      pathParameters: {'id': timerStatus.matchId.toString()},
      queryParameters: {
        'improvisationId': timerStatus.improvisationId.toString(),
        'durationIndex': timerStatus.durationIndex.toString(),
      },
    );
  }
}
