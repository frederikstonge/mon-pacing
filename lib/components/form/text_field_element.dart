import 'dart:async';

import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autoFocus;
  final bool autoUnfocus;
  final bool multiline;
  final FutureOr<void> Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? suffixIcon;

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
    this.hintText,
    this.suffixIcon,
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
          textCapitalization: TextCapitalization.sentences,
          focusNode: focusNode,
          decoration: InputDecoration(hintText: hintText, suffixIcon: suffixIcon),
          controller: controller,
          autofocus: autoFocus,
          maxLines: multiline ? null : 1,
          minLines: multiline ? 2 : null,
          onChanged: onChanged,
          validator: validator,
          keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
          onTapOutside: (event) {
            if (autoUnfocus) {
              FocusScope.of(context).unfocus();
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
