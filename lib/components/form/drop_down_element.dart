import 'dart:async';

import 'package:flutter/material.dart';

class DropDownElement<T> extends StatelessWidget {
  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final FutureOr<void> Function(T value)? onChanged;

  const DropDownElement({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    this.onChanged,
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
        DropdownButtonFormField<T>(
          isExpanded: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          value: value,
          icon: const Icon(Icons.arrow_downward),
          onChanged: (value) {
            onChanged?.call(value as T);
          },
          items: items,
        ),
      ],
    );
  }
}
