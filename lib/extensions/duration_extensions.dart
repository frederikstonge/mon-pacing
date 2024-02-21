extension DurationExtensions on Duration {
  String toImprovDuration() {
    String value = '$inMinutes min';
    final seconds = inSeconds % 60;
    if (seconds != 0) {
      value = '$value $seconds sec';
    }

    return value;
  }
}
