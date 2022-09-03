class SettingsModel {
  int color;
  bool enableDarkTheme;
  bool enablePaddingDuration;
  Duration paddingDuration;

  SettingsModel({
    required this.color,
    required this.enableDarkTheme,
    required this.enablePaddingDuration,
    required this.paddingDuration,
  });
}
