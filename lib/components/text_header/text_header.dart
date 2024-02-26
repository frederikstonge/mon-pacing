import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final String? tooltip;

  const TextHeader({
    super.key,
    required this.title,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineSmall),
        if (tooltip != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Tooltip(
              showDuration: const Duration(seconds: 6),
              message: tooltip,
              triggerMode: TooltipTriggerMode.tap,
              child: const Icon(Icons.info),
            ),
          )
        ],
      ],
    );
  }
}
