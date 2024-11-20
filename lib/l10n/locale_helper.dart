import 'dart:ui';

import 'package:intl/intl.dart';

class LocaleHelper {
  static Locale getCurrentLocale() => parseLocale(Intl.getCurrentLocale());

  static Locale parseLocale(String input) {
    if (input.length == 2) {
      return Locale(input);
    }

    return Locale(input.substring(0, 2), input.substring(3, 5));
  }
}
