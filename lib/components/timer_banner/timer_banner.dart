import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../extensions/duration_extensions.dart';
import '../../l10n/generated/app_localizations.dart';
import '../../models/improvisation_model.dart';
import '../../models/match_model.dart';
import '../../models/timer_model.dart';
import '../../router/routes.dart';
import '../buttons/loading_icon_button.dart';

class TimerBanner extends StatelessWidget {
  final TimerModel timer;
  final MatchModel? match;
  final ImprovisationModel? improvisation;

  const TimerBanner({super.key, required this.timer, this.match, this.improvisation});

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
                onPressed: () => _goToMatch(context, timer),
                icon: Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
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
