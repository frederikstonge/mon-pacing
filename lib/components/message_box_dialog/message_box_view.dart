import 'package:kaisel/kaisel.dart';
import 'package:material_ui/material_ui.dart';

class QuestionView extends StatelessWidget {
  final String question;
  final String yesLabel;
  final String noLabel;

  const QuestionView({super.key, required this.question, required this.yesLabel, required this.noLabel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: Text(
        question,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        FilledButton(
          onPressed: () => context.completeFlow<bool>(true),
          child: Text(yesLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        FilledButton.tonal(
          onPressed: () => context.completeFlow<bool>(false),
          child: Text(noLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}

class AlertView extends StatelessWidget {
  final String message;
  final String closeLabel;

  const AlertView({super.key, required this.message, required this.closeLabel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(
          onPressed: () => context.dismissFlow(),
          child: Text(closeLabel, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }
}
