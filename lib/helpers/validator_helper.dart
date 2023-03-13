import 'package:flutter/material.dart';

import '../dialogs/message_dialog.dart';
import '../l10n/generated/l10n.dart';

class ValidationHelper {
  static Future<void> showValidationMessageDialog(BuildContext context) async {
    await MessageDialog.showMessageDialog(
      context,
      S.current.ValidadatorHelper_ValidationMessageDialog_Title,
      S.current.ValidadatorHelper_ValidationMessageDialog_Content,
    );
  }

  static String? fieldIsRequired(String? value) {
    if (value == null || value.isEmpty) {
      return S.current.ValidadatorHelper_FieldIsRequired;
    }

    return null;
  }

  static String? fieldIsNumber(String value) {
    if (int.tryParse(value) == null) {
      return S.current.ValidadatorHelper_FieldIsNumber;
    }

    return null;
  }
}
