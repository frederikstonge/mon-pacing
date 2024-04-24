import 'dart:async';

import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autoFocus;
  final bool autoUnfocus;
  final bool multiline;
  final FutureOr<void> Function(String value)? onChanged;
  final FutureOr<void> Function()? onTapOutside;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;

  const TextFieldElement({
    super.key,
    required this.label,
    required this.controller,
    this.autoFocus = false,
    this.autoUnfocus = true,
    this.multiline = false,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.onTapOutside,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        TextFormField(
          controller: controller,
          autofocus: autoFocus,
          focusNode: focusNode,
          maxLines: multiline ? null : 1,
          minLines: multiline ? 2 : null,
          onChanged: onChanged,
          validator: validator,
          keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
          onTapOutside: (event) async {
            if (autoUnfocus) {
              FocusScope.of(context).unfocus();
            }
            if (onTapOutside != null) {
              await onTapOutside!.call();
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
