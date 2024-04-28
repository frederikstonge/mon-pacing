extension DurationExtensions on Duration {
  String toImprovDuration() {
    String value = '';

    if (inSeconds <= 0) {
      return '-';
    }

    if (inMinutes > 0) {
      value += '$inMinutes min';
    }

    final seconds = inSeconds % 60;
    if (seconds != 0) {
      value += ' $seconds sec';
    }

    return value.trim();
  }
}
