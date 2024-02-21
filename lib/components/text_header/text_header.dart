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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
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
        ),
        const Divider(),
      ],
    );
  }
}
