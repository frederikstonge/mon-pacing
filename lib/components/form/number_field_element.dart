import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberFieldElement extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool autoFocus;
  final FutureOr<void> Function(int? value)? onChanged;
  final String? Function(String?)? validator;

  const NumberFieldElement({
    super.key,
    required this.label,
    required this.controller,
    this.autoFocus = false,
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
          onChanged: (value) => onChanged?.call(int.tryParse(value)),
          validator: validator,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
