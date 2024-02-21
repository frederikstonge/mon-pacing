import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class Validators {
  static String? stringRequired(BuildContext context, String fieldName, String? value) {
    return value?.isEmpty ?? true ? S.of(context).stringIsRequired(fieldName) : null;
  }
}
