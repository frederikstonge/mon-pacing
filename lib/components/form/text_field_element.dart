import 'dart:async';

import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autoFocus;
  final bool multiline;
  final FutureOr<void> Function(String value)? onChanged;
  final String? Function(String?)? validator;

  const TextFieldElement({
    super.key,
    required this.label,
    required this.controller,
    this.autoFocus = false,
    this.multiline = false,
    this.onChanged,
    this.validator,
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
          maxLines: multiline ? null : 1,
          minLines: multiline ? 2 : null,
          onChanged: onChanged,
          validator: validator,
          keyboardType: multiline ? TextInputType.multiline : TextInputType.text,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
