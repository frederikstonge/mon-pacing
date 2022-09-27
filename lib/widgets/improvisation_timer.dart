import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../models/improvisation_model.dart';
import 'circular_countdown_timer.dart';

class ImprovisationTimer extends StatefulWidget {
  final ImprovisationModel improvisation;
  const ImprovisationTimer({super.key, required this.improvisation});

  @override
  State<ImprovisationTimer> createState() => _ImprovisationTimerState();
}

class _ImprovisationTimerState extends State<ImprovisationTimer> with AutomaticKeepAliveClientMixin {
  final _controller = CountDownController();
  int? lastTimeStamp;
  bool isStarted = false;
  bool isPaused = false;
  bool isResumed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        CircularCountDownTimer(
          duration: widget.improvisation.duration.inSeconds,
          initialDuration: 0,
          controller: _controller,
          ringColor: Theme.of(context).colorScheme.background,
          ringGradient: null,
          fillColor: Theme.of(context).colorScheme.primary,
          fillGradient: null,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          backgroundGradient: null,
          strokeWidth: 20.0,
          strokeCap: StrokeCap.round,
          textStyle: TextStyle(fontSize: 33.0, color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold),
          textFormat: CountdownTextFormat.minutesSeconds,
          isReverse: true,
          isReverseAnimation: true,
          autoStart: false,
          isTimerTextShown: true,
          onChange: (Duration timeStamp) {
            var valueInSeconds = timeStamp.inSeconds;
            if (valueInSeconds != lastTimeStamp) {
              if (valueInSeconds == 0) {
                setState(() {
                  isStarted = false;
                  isPaused = false;
                  isResumed = false;
                });
              } else if (valueInSeconds % 60 == 0) {
                Vibrate.vibrate();
              } else if (valueInSeconds == 30) {
                Vibrate.vibrate();
              } else if (valueInSeconds == 10) {
                Vibrate.vibrate();
              } else if (valueInSeconds <= 5) {
                Vibrate.vibrate();
              }

              lastTimeStamp = valueInSeconds;
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  disabledColor: Theme.of(context).colorScheme.background,
                  onPressed: isPaused || !isStarted ? _play : null,
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  disabledColor: Theme.of(context).colorScheme.background,
                  onPressed: isStarted && !isPaused ? _pause : null,
                  icon: const Icon(Icons.pause),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: IconButton(
                  color: Theme.of(context).colorScheme.onPrimary,
                  disabledColor: Theme.of(context).colorScheme.background,
                  onPressed: isStarted ? _reset : null,
                  icon: const Icon(Icons.undo),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _play() {
    if (!isStarted) {
      _controller.start();
      setState(() {
        isStarted = true;
        isResumed = false;
        isPaused = false;
      });
    } else {
      _controller.resume();
      setState(() {
        isStarted = true;
        isResumed = true;
        isPaused = false;
      });
    }
  }

  _pause() {
    _controller.pause();
    setState(() {
      isStarted = true;
      isResumed = false;
      isPaused = true;
    });
  }

  _reset() {
    _controller.reset();
    setState(() {
      isStarted = false;
      isPaused = false;
      isResumed = false;
    });
  }
}
