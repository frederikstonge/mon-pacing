import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Create a Circular Countdown Timer.
class CircularCountDownTimer extends StatefulWidget {
  /// Filling Color for Countdown Widget.
  final Color fillColor;

  /// Filling Gradient for Countdown Widget.
  final Gradient? fillGradient;

  /// Ring Color for Countdown Widget.
  final Color ringColor;

  /// Ring Gradient for Countdown Widget.
  final Gradient? ringGradient;

  /// Background Color for Countdown Widget.
  final Color? backgroundColor;

  /// Background Gradient for Countdown Widget.
  final Gradient? backgroundGradient;

  /// This Callback will execute when the Countdown Changes.
  final ValueChanged<Duration>? onChange;

  /// Countdown duration in Seconds.
  final int duration;

  /// Countdown initial elapsed Duration in Seconds.
  final int initialDuration;

  /// Border Thickness of the Countdown Ring.
  final double strokeWidth;

  /// Begin and end contours with a flat edge and no extension.
  final StrokeCap strokeCap;

  /// Text Style for Countdown Text.
  final TextStyle? textStyle;

  /// Format for the Countdown Text.
  final String? textFormat;

  /// Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
  final bool isReverse;

  /// Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
  final bool isReverseAnimation;

  /// Handles visibility of the Countdown Text.
  final bool isTimerTextShown;

  /// Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
  final CountDownController? controller;

  /// Handles the timer start.
  final bool autoStart;

  const CircularCountDownTimer({
    super.key,
    required this.duration,
    required this.fillColor,
    required this.ringColor,
    this.backgroundColor,
    this.fillGradient,
    this.ringGradient,
    this.backgroundGradient,
    this.initialDuration = 0,
    this.isReverse = false,
    this.isReverseAnimation = false,
    this.onChange,
    this.strokeWidth = 5.0,
    this.strokeCap = StrokeCap.butt,
    this.textStyle,
    this.isTimerTextShown = true,
    this.autoStart = true,
    this.textFormat,
    this.controller,
  }) : assert(initialDuration <= duration);

  @override
  State<CircularCountDownTimer> createState() => CircularCountDownTimerState();
}

class CircularCountDownTimerState extends State<CircularCountDownTimer> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _countDownAnimation;

  String get time {
    String timeStamp = "";
    if (widget.isReverse && !widget.autoStart && !widget.controller!.isStarted) {
      timeStamp = _getTime(Duration(seconds: widget.duration));
    } else {
      final duration = _controller!.duration! * _controller!.value;
      timeStamp = _getTime(duration);
    }

    return timeStamp;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.duration),
    );

    _controller!.addListener(_onChange);

    _setAnimation();
    _setAnimationDirection();
    _setController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          return Align(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: CustomPaint(
                      painter: CustomTimerPainter(
                          animation: _countDownAnimation ?? _controller,
                          fillColor: widget.fillColor,
                          fillGradient: widget.fillGradient,
                          ringColor: widget.ringColor,
                          ringGradient: widget.ringGradient,
                          strokeWidth: widget.strokeWidth,
                          strokeCap: widget.strokeCap,
                          isReverse: widget.isReverse,
                          isReverseAnimation: widget.isReverseAnimation,
                          backgroundColor: widget.backgroundColor,
                          backgroundGradient: widget.backgroundGradient),
                    ),
                  ),
                  widget.isTimerTextShown
                      ? Align(
                          alignment: FractionalOffset.center,
                          child: Text(
                            time,
                            style: widget.textStyle ??
                                const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller!.removeListener(_onChange);
    _controller!.stop();
    _controller!.dispose();
    super.dispose();
  }

  void _setAnimation() {
    if (widget.autoStart) {
      if (widget.isReverse) {
        _controller!.reverse(from: 1);
      } else {
        _controller!.forward();
      }
    }
  }

  void _setAnimationDirection() {
    if ((!widget.isReverse && widget.isReverseAnimation) || (widget.isReverse && !widget.isReverseAnimation)) {
      _countDownAnimation = Tween<double>(begin: 1, end: 0).animate(_controller!);
    }
  }

  void _setController() {
    widget.controller?._state = this;
    widget.controller?._isReverse = widget.isReverse;
    widget.controller?._initialDuration = widget.initialDuration;
    widget.controller?._duration = widget.duration;
    widget.controller?.isStarted = widget.autoStart;

    if (widget.initialDuration > 0 && widget.autoStart) {
      if (widget.isReverse) {
        _controller?.value = 1 - (widget.initialDuration / widget.duration);
      } else {
        _controller?.value = (widget.initialDuration / widget.duration);
      }
    }
  }

  String _getTime(Duration duration) {
    // For HH:mm:ss format
    if (widget.textFormat == CountdownTextFormat.hoursMinutesSeconds) {
      return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    // For mm:ss format
    else if (widget.textFormat == CountdownTextFormat.minutesSeconds) {
      return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    }
    // For ss format
    else if (widget.textFormat == CountdownTextFormat.seconds) {
      return (duration.inSeconds).toString().padLeft(2, '0');
    }
    // For s format
    else if (widget.textFormat == CountdownTextFormat.second) {
      return '${(duration.inSeconds)}';
    } else {
      // Default format
      return _defaultFormat(duration);
    }
  }

  String _defaultFormat(Duration duration) {
    if (duration.inHours != 0) {
      return '${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    } else if (duration.inMinutes != 0) {
      return '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
    } else {
      return '${duration.inSeconds % 60}';
    }
  }

  void _onChange() {
    if (widget.onChange != null) {
      widget.onChange!(_controller!.duration! * _controller!.value);
    }
  }
}

/// Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
class CountDownController {
  late CircularCountDownTimerState _state;
  late bool _isReverse;
  bool isStarted = false, isPaused = false, isResumed = false;
  int? _initialDuration, _duration;

  /// This Method Starts the Countdown Timer
  void start() {
    if (_isReverse) {
      _state._controller?.reverse(from: _initialDuration == 0 ? 1 : 1 - (_initialDuration! / _duration!));
    } else {
      _state._controller?.forward(from: _initialDuration == 0 ? 0 : (_initialDuration! / _duration!));
    }

    isStarted = true;
  }

  /// This Method Pauses the Countdown Timer
  void pause() {
    _state._controller?.stop(canceled: false);
    isPaused = true;
  }

  /// This Method Resumes the Countdown Timer
  void resume() {
    if (_isReverse) {
      _state._controller?.reverse(from: _state._controller!.value);
    } else {
      _state._controller?.forward(from: _state._controller!.value);
    }
    isResumed = true;
  }

  /// This Method Restarts the Countdown Timer,
  /// Here optional int parameter **duration** is the updated duration for countdown timer
  void restart({int? duration}) {
    _state._controller!.duration = Duration(seconds: duration ?? _state._controller!.duration!.inSeconds);
    if (_isReverse) {
      _state._controller?.reverse(from: 1);
    } else {
      _state._controller?.forward(from: 0);
    }
    isStarted = true;
    isPaused = false;
    isResumed = false;
  }

  /// This Method resets the Countdown Timer
  void reset() {
    _state._controller?.reset();
    isStarted = _state.widget.autoStart;
    isPaused = false;
    isResumed = false;
  }
}

class CountdownTextFormat {
  static const String hoursMinutesSeconds = "HH:mm:ss";
  static const String minutesSeconds = "mm:ss";
  static const String seconds = "ss";
  static const String second = "s";
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.fillColor,
    this.fillGradient,
    this.ringColor,
    this.ringGradient,
    this.strokeWidth,
    this.strokeCap,
    this.backgroundColor,
    this.isReverse,
    this.isReverseAnimation,
    this.backgroundGradient,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? fillColor, ringColor, backgroundColor;
  final double? strokeWidth;
  final StrokeCap? strokeCap;
  final bool? isReverse, isReverseAnimation;
  final Gradient? fillGradient, ringGradient, backgroundGradient;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ringColor!
      ..strokeWidth = strokeWidth!
      ..strokeCap = strokeCap!
      ..style = PaintingStyle.stroke;

    if (ringGradient != null) {
      final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
      paint.shader = ringGradient!.createShader(rect);
    } else {
      paint.shader = null;
    }

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    final progress = (animation!.value) * 2 * math.pi;
    const startAngle = math.pi * 1.5;

    if (fillGradient != null) {
      final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);
      paint.shader = fillGradient!.createShader(rect);
    } else {
      paint.shader = null;
      paint.color = fillColor!;
    }

    canvas.drawArc(Offset.zero & size, startAngle, progress, false, paint);

    if (backgroundColor != null || backgroundGradient != null) {
      final backgroundPaint = Paint();

      if (backgroundGradient != null) {
        final rect = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2.2);
        backgroundPaint.shader = backgroundGradient!.createShader(rect);
      } else {
        backgroundPaint.color = backgroundColor!;
      }
      canvas.drawCircle(size.center(Offset.zero), size.width / 2.2, backgroundPaint);
    }
  }

  @override
  bool shouldRepaint(CustomTimerPainter oldDelegate) {
    return animation!.value != oldDelegate.animation!.value || ringColor != oldDelegate.ringColor || fillColor != oldDelegate.fillColor;
  }
}
