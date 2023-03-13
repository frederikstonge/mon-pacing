import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import 'circular_countdown_timer.dart';

class ImprovisationTimer extends StatefulWidget {
  final List<Duration> durations;

  const ImprovisationTimer({
    super.key,
    required this.durations,
  });

  @override
  State<ImprovisationTimer> createState() => _ImprovisationTimerState();
}

class _ImprovisationTimerState extends State<ImprovisationTimer> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late final CountDownController _countdownController;
  late final TabController _tabController;
  late final PageController _pageController;
  int? lastTimeStamp;
  bool isStarted = false;
  bool isPaused = false;
  bool isResumed = false;
  bool tabLocked = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _countdownController = CountDownController();
    _tabController = TabController(length: widget.durations.length, vsync: this);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final hasMultipleDurations = widget.durations.length > 1;
    final ColorScheme colors = Theme.of(context).colorScheme;
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.shortestSide / 1.5,
          width: MediaQuery.of(context).size.shortestSide / 1.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemCount: widget.durations.length,
                onPageChanged: (value) => _tabController.animateTo(value),
                itemBuilder: (context, index) => CircularCountDownTimer(
                  duration: widget.durations.first.inSeconds,
                  initialDuration: 0,
                  controller: _countdownController,
                  ringColor: colors.primary.withOpacity(0.4),
                  ringGradient: null,
                  fillColor: colors.primary,
                  fillGradient: null,
                  backgroundColor: colors.primary,
                  backgroundGradient: null,
                  strokeWidth: 16.0,
                  strokeCap: StrokeCap.round,
                  textStyle: TextStyle(fontSize: 33.0, color: colors.onPrimary, fontWeight: FontWeight.bold),
                  textFormat: CountdownTextFormat.minutesSeconds,
                  isReverse: true,
                  isReverseAnimation: true,
                  autoStart: false,
                  isTimerTextShown: true,
                  onChange: (Duration timeStamp) {
                    final valueInSeconds = timeStamp.inSeconds;
                    if (valueInSeconds != lastTimeStamp) {
                      if (valueInSeconds % 60 == 0 || valueInSeconds == 30 || valueInSeconds == 10 || valueInSeconds <= 5) {
                        Vibrate.vibrate();
                      } else if (valueInSeconds == 0) {
                        setState(() {
                          isStarted = false;
                          isPaused = false;
                          isResumed = false;
                        });

                        if (hasMultipleDurations) {
                          _nextPage();
                        }
                      }

                      setState(() => lastTimeStamp = valueInSeconds);
                    }
                  },
                ),
              ),
              if (hasMultipleDurations)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                        onPressed: _previousPage,
                        icon: Icon(
                          Icons.arrow_back,
                          color: colors.onPrimary,
                        )),
                    IconButton(
                        onPressed: _nextPage,
                        icon: Icon(
                          Icons.arrow_forward,
                          color: colors.onPrimary,
                        )),
                  ],
                ),
            ],
          ),
        ),
        if (hasMultipleDurations)
          TabPageSelector(
            controller: _tabController,
          ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: isPaused || !isStarted ? _play : null,
              icon: const Icon(Icons.play_arrow),
              style: IconButton.styleFrom(
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                hoverColor: colors.onPrimary.withOpacity(0.08),
                focusColor: colors.onPrimary.withOpacity(0.12),
                highlightColor: colors.onPrimary.withOpacity(0.12),
              ),
            ),
            IconButton(
              onPressed: isStarted && !isPaused ? _pause : null,
              icon: const Icon(Icons.pause),
              style: IconButton.styleFrom(
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                hoverColor: colors.onPrimary.withOpacity(0.08),
                focusColor: colors.onPrimary.withOpacity(0.12),
                highlightColor: colors.onPrimary.withOpacity(0.12),
              ),
            ),
            IconButton(
              onPressed: isStarted ? _reset : null,
              icon: const Icon(Icons.undo),
              style: IconButton.styleFrom(
                foregroundColor: colors.onPrimary,
                backgroundColor: colors.primary,
                disabledBackgroundColor: colors.onSurface.withOpacity(0.12),
                hoverColor: colors.onPrimary.withOpacity(0.08),
                focusColor: colors.onPrimary.withOpacity(0.12),
                highlightColor: colors.onPrimary.withOpacity(0.12),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _play() {
    if (!isStarted) {
      _countdownController.start();
      setState(() {
        isStarted = true;
        isResumed = false;
        isPaused = false;
      });
    } else {
      _countdownController.resume();
      setState(() {
        isStarted = true;
        isResumed = true;
        isPaused = false;
      });
    }
  }

  void _pause() {
    _countdownController.pause();
    setState(() {
      isStarted = true;
      isResumed = false;
      isPaused = true;
    });
  }

  void _reset() {
    _countdownController.reset();
    setState(() {
      isStarted = false;
      isPaused = false;
      isResumed = false;
    });
  }

  void _nextPage() {
    _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  void _previousPage() {
    _pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}
