import 'package:flutter/material.dart';

import '../actions/loading_button.dart';

class MessageBoxDialog {
  static Future<bool?> questionShow(BuildContext context, String question, String yesLabel, String noLabel) => showDialog<bool?>(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        barrierColor: Theme.of(context).colorScheme.onSurface.withAlpha(100),
        builder: (BuildContext context) => Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: _MessageBoxContent(
              question: question,
              yesLabel: yesLabel,
              noLabel: noLabel,
            ),
          ),
        ),
      );
}

class _MessageBoxContent extends StatelessWidget {
  final String question;
  final String yesLabel;
  final String noLabel;

  const _MessageBoxContent({
    required this.question,
    required this.yesLabel,
    required this.noLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          question,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            LoadingButton.filled(
                child: Text(
                  yesLabel,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () => Navigator.of(context).pop(true)),
            LoadingButton.tonal(
                child: Text(
                  noLabel,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                onPressed: () => Navigator.of(context).pop(false)),
          ],
        ),
      ],
    );
  }
}
