import 'package:flutter/material.dart';

class CustomTooltip extends StatelessWidget {
  final String tooltip;

  const CustomTooltip({
    super.key,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      showDuration: const Duration(seconds: 6),
      message: tooltip,
      triggerMode: TooltipTriggerMode.tap,
      child: const Icon(Icons.info),
    );
  }
}
