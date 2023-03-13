import 'package:flutter/material.dart';

import '../helpers/validator_helper.dart';
import '../l10n/generated/l10n.dart';

class NumberDialog {
  static Future<void> showNumberDialog(
    BuildContext context,
    String title,
    int defaultValue,
    bool selectAll,
    Future<void> Function(int) onSave,
  ) async {
    await showDialog(
      context: context,
      builder: (BuildContext alertContext) => NumberDialogContent(
        title: title,
        defaultValue: defaultValue,
        selectAll: selectAll,
        onSave: onSave,
      ),
    );
  }
}

class NumberDialogContent extends StatefulWidget {
  final String title;
  final int defaultValue;
  final bool selectAll;
  final Future<void> Function(int) onSave;

  const NumberDialogContent({
    super.key,
    required this.title,
    required this.defaultValue,
    required this.selectAll,
    required this.onSave,
  });

  @override
  State<NumberDialogContent> createState() => _NumberDialogContentState();
}

class _NumberDialogContentState extends State<NumberDialogContent> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  void initState() {
    textController.text = widget.defaultValue.toString();

    if (widget.selectAll) {
      textController.selection = TextSelection(baseOffset: 0, extentOffset: widget.defaultValue.toString().length);
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
          keyboardType: TextInputType.number,
          validator: (value) {
            return ValidationHelper.fieldIsRequired(value) ?? ValidationHelper.fieldIsNumber(value!);
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
              await widget.onSave(int.parse(value));
            }
          },
        ),
      ],
    );
  }
}
