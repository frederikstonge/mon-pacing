extension StringExtensions on String {
  String sanitizeFilename({String replacement = ''}) {
    final result =
        // illegalRe
        replaceAll(RegExp(r'[\/\?<>\\:\*\|"]'), replacement)
            // controlRe
            .replaceAll(RegExp(r'[\x00-\x1f\x80-\x9f]'), replacement)
            // reservedRe
            .replaceFirst(RegExp(r'^\.+$'), replacement)
            // windowsReservedRe
            .replaceFirst(RegExp(r'^(con|prn|aux|nul|com[0-9]|lpt[0-9])(\..*)?$', caseSensitive: false), replacement)
            // windowsTrailingRe
            .replaceFirst(RegExp(r'[\. ]+$'), replacement);

    return result.length > 255 ? result.substring(0, 255) : result;
  }
}
