import 'package:intl/intl.dart';

extension DurationExtensions on Duration {
  String toImprovDuration() {
    final formatter = NumberFormat('00');
    String value = '';

    final hasHours = inHours > 0;
    final minutes = inMinutes % 60;
    final hasMinutes = minutes > 0;
    final seconds = inSeconds % 60;

    if (hasHours) {
      value += '$inHours:';
    }

    if (hasHours) {
      value += '${formatter.format(minutes)}:';
    } else {
      value += '$minutes:';
    }

    value += formatter.format(seconds);

    return value;
  }
}
