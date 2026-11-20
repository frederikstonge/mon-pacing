import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/form/tags_field_element.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/models/tag_model.dart';

void main() {
  testWidgets('suggests, adds, removes, and restores existing tags', (tester) async {
    var tags = <TagModel>[];
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: TagsFieldElement(
            label: 'Tags',
            initialTags: [const TagModel(id: 7, name: 'Existing')],
            getAllTags: (search) async => ['Existing', 'Suggested'],
            onChanged: (value) => tags = value,
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'Sug');
    await tester.pumpAndSettle();
    expect(find.widgetWithText(ActionChip, 'Suggested'), findsOneWidget);
    await tester.tap(find.widgetWithText(ActionChip, 'Suggested'));
    await tester.pumpAndSettle();
    expect(tags.map((tag) => tag.name), ['Existing', 'Suggested']);

    final existing = tester.widget<Chip>(find.widgetWithText(Chip, 'Existing'));
    existing.onDeleted!();
    await tester.pumpAndSettle();
    expect(tags.map((tag) => tag.name), ['Suggested']);

    await tester.enterText(find.byType(TextField), 'Existing');
    await tester.testTextInput.receiveAction(TextInputAction.done);
    await tester.pumpAndSettle();
    expect(tags.last.id, 7);
  });

  testWidgets('keeps invalid tag text and displays validation error', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: TagsFieldElement(label: 'Tags', initialTags: const [], getAllTags: (search) async => []),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), 'ok,');
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).controller!.text, 'ok,');
    expect(tester.widget<TextField>(find.byType(TextField)).decoration!.errorText, isNotNull);
  });
}
