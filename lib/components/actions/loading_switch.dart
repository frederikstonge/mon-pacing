import 'dart:async';

import 'package:flutter/material.dart';

class LoadingSwitch extends StatelessWidget {
  final bool value;
  final FutureOr<void> Function(bool value) onChanged;

  const LoadingSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: value,
        onChanged: (value) async {
          return await onChanged.call(value);
        });
  }
}
