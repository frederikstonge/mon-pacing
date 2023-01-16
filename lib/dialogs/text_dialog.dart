import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../helpers/validator_helper.dart';

class TextDialog {
  static showTextDialog(BuildContext context, String title, String defaultValue, bool selectAll, Future<void> Function(String) onSave) {
    final textController = TextEditingController(text: defaultValue);
    if (selectAll) {
      textController.selection = TextSelection(baseOffset: 0, extentOffset: defaultValue.length);
    }

    final formKey = GlobalKey<FormState>();
    showDialog(
      context: context,
      builder: (BuildContext alertContext) => AlertDialog(
        title: Text(title, overflow: TextOverflow.ellipsis),
        content: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: TextFormField(
            autofocus: true,
            controller: textController,
            validator: (value) {
              return ValidationHelper.fieldIsRequired(value);
            },
          ),
        ),
        actions: [
          TextButton(
            child: Text(S.of(context).Dialog_Cancel),
            onPressed: () {
              Navigator.pop(alertContext, false);
            },
          ),
          TextButton(
            child: Text(S.of(context).Dialog_Ok),
            onPressed: () async {
              var result = formKey.currentState!.validate();
              if (result) {
                var navigator = Navigator.of(alertContext);
                navigator.pop(true);
                await onSave(textController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
