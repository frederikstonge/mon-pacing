String getDurationString(Duration duration) {
  String value = "${duration.inMinutes} min";
  var seconds = duration.inSeconds % 60;
  if (seconds != 0) {
    value = "$value $seconds sec";
  }

  return value;
}
