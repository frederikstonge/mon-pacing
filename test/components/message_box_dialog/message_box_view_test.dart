import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/message_box_dialog/message_box_view.dart';

void main() {
  for (final (name, child) in [
    ('question', const QuestionView(question: 'Continue?', yesLabel: 'Yes', noLabel: 'No')),
    ('alert', const AlertView(message: 'Message', closeLabel: 'Close')),
  ]) {
    testWidgets('$name is centered even when the dialog theme specifies another alignment', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: ThemeData(dialogTheme: const DialogThemeData(alignment: Alignment.bottomCenter)),
          home: child,
        ),
      );

      final surface = find.descendant(
        of: find.byType(AlertDialog),
        matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
      );
      final screen = tester.getRect(find.byType(Navigator));
      final dialog = tester.getRect(surface);
      expect(dialog.center.dx, closeTo(screen.center.dx, 0.01));
      expect(dialog.center.dy, closeTo(screen.center.dy, 0.01));
    });
  }
}
