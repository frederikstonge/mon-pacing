import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MessageBoxDialog {
  static Future<bool?> questionShow(BuildContext context, String question, String yesLabel, String noLabel) => show(
        context,
        Column(
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
                FilledButton(child: Text(yesLabel, style: const TextStyle(fontWeight: FontWeight.bold)), onPressed: () => context.pop(true)),
                FilledButton.tonal(child: Text(noLabel, style: const TextStyle(fontWeight: FontWeight.bold)), onPressed: () => context.pop(false)),
              ],
            ),
          ],
        ),
      );

  static Future<bool?> show(BuildContext context, Widget child) => showDialog<bool?>(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        barrierColor: Theme.of(context).colorScheme.onBackground.withAlpha(100),
        builder: (BuildContext context) => Dialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: child,
          ),
        ),
      );
}
