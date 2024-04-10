import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubits/timer/timer_cubit.dart';
import '../../cubits/timer/timer_state.dart';
import '../../extensions/duration_extensions.dart';
import '../../router/routes.dart';
import '../../services/foreground_service/timer_status_model.dart';

class TimerBanner extends StatelessWidget {
  final FutureOr<void> Function(TimerStatusModel timerStatus)? onActionOverride;

  const TimerBanner({
    super.key,
    this.onActionOverride,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (state.timerStatus != null) ...[
              SafeArea(
                child: MaterialBanner(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  content: Text(
                    'test - ${Duration(milliseconds: state.timerStatus!.remainingMilliseconds).toImprovDuration()}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => onActionOverride != null
                          ? onActionOverride!.call(state.timerStatus!)
                          : context.goNamed(
                              Routes.match,
                              pathParameters: {'id': state.timerStatus!.matchId.toString()},
                              queryParameters: {
                                'improvisationId': state.timerStatus!.improvisationId.toString(),
                                'durationIndex': state.timerStatus!.durationIndex.toString(),
                              },
                            ),
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
