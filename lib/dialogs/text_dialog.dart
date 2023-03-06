import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../helpers/validator_helper.dart';

class TextDialog {
  static Future<void> showTextDialog(
    BuildContext context,
    String title,
    String defaultValue,
    bool selectAll,
    Future<void> Function(String) onSave,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext alertContext) => TextDialogContent(
        title: title,
        defaultValue: defaultValue,
        selectAll: selectAll,
        onSave: onSave,
      ),
    );
  }
}

class TextDialogContent extends StatefulWidget {
  final String title;
  final String defaultValue;
  final bool selectAll;
  final Future<void> Function(String) onSave;

  const TextDialogContent({
    super.key,
    required this.title,
    required this.defaultValue,
    required this.selectAll,
    required this.onSave,
  });

  @override
  State<TextDialogContent> createState() => _TextDialogContentState();
}

class _TextDialogContentState extends State<TextDialogContent> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.defaultValue;

    if (widget.selectAll) {
      textController.selection = TextSelection(baseOffset: 0, extentOffset: widget.defaultValue.length);
    }
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title, overflow: TextOverflow.ellipsis),
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
            Navigator.pop(context, false);
          },
        ),
        TextButton(
          child: Text(S.of(context).Dialog_Ok),
          onPressed: () async {
            final result = formKey.currentState!.validate();
            if (result) {
              final value = textController.text;
              Navigator.of(context).pop(true);
              await widget.onSave(value);
            }
          },
        ),
      ],
    );
  }
}
