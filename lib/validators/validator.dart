import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../l10n/app_localizations.dart';
import '../router/router.dart';

class Validators {
  static BuildContext get _context => rootNavigatorKey.currentContext!;

  static String? stringRequired(String? value) {
    return value?.isEmpty ?? true ? S.of(_context).required : null;
  }

  static String? intRequired(int? value) {
    return value == null ? S.of(_context).required : null;
  }

  static String? lesserThan(int value, int? maxValue) {
    return maxValue != null && value > maxValue ? S.of(_context).lesserThan(max: maxValue) : null;
  }

  static String? greaterThan(int value, int? minValue) {
    return minValue != null && value < minValue ? S.of(_context).greaterThan(min: minValue) : null;
  }

  static String? intMultipleOf(int value, int? multiple) {
    return multiple != null && value % multiple != 0 ? S.of(_context).multipleOf(multiple: multiple) : null;
  }

  static String? duplicateTag(String value, List<String> tags) {
    return tags.contains(value) ? S.of(_context).duplicateTag(tag: value) : null;
  }
}
