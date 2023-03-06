import 'package:flutter/material.dart';

import '../dialogs/message_dialog.dart';
import '../generated/l10n.dart';

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
}
