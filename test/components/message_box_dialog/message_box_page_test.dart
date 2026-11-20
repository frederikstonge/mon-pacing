import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/message_box_dialog/message_box_page.dart';

void main() {
  testWidgets('dialog is centered on the screen with asymmetric safe areas', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(padding: const EdgeInsets.fromLTRB(30, 80, 10, 20)),
          child: child!,
        ),
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(const MessageBoxPage(child: AlertDialog(content: Text('Message'))).createRoute(context)),
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    final surface = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
    );
    final screen = tester.getRect(find.byType(Navigator));
    final dialog = tester.getRect(surface);
    expect(dialog.center.dx, closeTo(screen.center.dx, 0.01));
    expect(dialog.center.dy, closeTo(screen.center.dy, 0.01));
    expect(dialog.left, greaterThanOrEqualTo(screen.left + 30));
    expect(dialog.top, greaterThanOrEqualTo(screen.top + 80));

    await tester.tapAt(const Offset(5, 5));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsNothing);
  });

  testWidgets('dialog stays above the keyboard', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(padding: const EdgeInsets.only(top: 40), viewInsets: const EdgeInsets.only(bottom: 240)),
          child: child!,
        ),
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () =>
                Navigator.of(context)
                    .push(const MessageBoxPage(child: AlertDialog(content: Text('Message'))).createRoute(context)),
            child: const Text('Open'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    final surface = find.descendant(
      of: find.byType(AlertDialog),
      matching: find.byWidgetPredicate((widget) => widget is Material && widget.type == MaterialType.card),
    );
    final screen = tester.getRect(find.byType(Navigator));
    final dialog = tester.getRect(surface);
    expect(dialog.bottom, lessThanOrEqualTo(screen.bottom - 240));
    expect(dialog.center.dy, closeTo(screen.center.dy - 120, 0.01));
  });
}
