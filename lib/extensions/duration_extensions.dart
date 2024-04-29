import 'package:intl/intl.dart';

extension DurationExtensions on Duration {
  String toImprovDuration() {
    final formatter = NumberFormat('00');
    String value = '';

    if (inHours > 0) {
      value += '${formatter.format(inHours)}:';
    }

    final minutes = (inMinutes % 60);
    final seconds = inSeconds % 60;

    return value += '${formatter.format(minutes)}:${formatter.format(seconds)}';
  }
}
