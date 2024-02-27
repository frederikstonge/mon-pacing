import 'package:flutter/material.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final String? tooltip;
  final Widget? trailing;

  const TextHeader({
    super.key,
    required this.title,
    this.tooltip,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
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
        ),
        if (trailing != null) ...[
          trailing!,
        ]
      ],
    );
  }
}
