import 'dart:async';

import 'package:flutter/material.dart';

class TextFieldElement extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autoFocus;
  final int maxLines;
  final FutureOr<void> Function(String value)? onChanged;
  final String? Function(String?)? validator;

  const TextFieldElement({
    super.key,
    required this.label,
    required this.controller,
    this.autoFocus = false,
    this.maxLines = 1,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
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
            maxLines: maxLines,
            minLines: maxLines > 1 ? 2 : null,
            onChanged: onChanged,
            validator: validator,
            keyboardType: maxLines == 1 ? TextInputType.text : TextInputType.multiline,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
        ],
      ),
    );
  }
}
