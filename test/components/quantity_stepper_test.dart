import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/quantity_stepper/quantity_stepper_form_field.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/themes/themes.dart';

void main() {
  testWidgets('buttons and direct editing respect bounds and update the value', (tester) async {
    final changes = <int?>[];
    await tester.pumpWidget(
      MaterialApp(
        theme: Themes.light(),
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: Center(
            child: QuantityStepperFormField(initialValue: 1, minValue: 0, maxValue: 2, onChanged: changes.add),
          ),
        ),
      ),
    );

    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(changes.last, 2);
    expect(
      tester.widget<IconButton>(find.byWidgetPredicate((w) => w is IconButton && w.tooltip == 'Add')).onPressed,
      isNull,
    );
    await tester.tap(find.byTooltip('Remove'));
    await tester.pumpAndSettle();
    expect(changes.last, 1);
    await tester.enterText(find.byType(TextField), '0');
    await tester.pumpAndSettle();
    expect(changes.last, 0);
    expect(
      tester.widget<IconButton>(find.byWidgetPredicate((w) => w is IconButton && w.tooltip == 'Remove')).onPressed,
      isNull,
    );
    expect(tester.widget<TextField>(find.byType(TextField)).decoration!.filled, isFalse);
  });

  testWidgets('step buttons correct edited values to the nearest multiple', (tester) async {
    int? lastValue;
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: Center(
            child: QuantityStepperFormField(
              initialValue: 5,
              minValue: 0,
              maxValue: 20,
              multiple: 5,
              onChanged: (value) => lastValue = value,
            ),
          ),
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), '6');
    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(lastValue, 10);
    await tester.enterText(find.byType(TextField), '13');
    await tester.tap(find.byTooltip('Add'));
    await tester.pumpAndSettle();
    expect(lastValue, 20);
  });

  testWidgets('counter accommodates larger system text', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: [S.delegate, ...GlobalMaterialLocalizations.delegates],
        supportedLocales: S.supportedLocales,
        home: MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(2)),
          child: Scaffold(
            body: Center(
              child: QuantityStepperFormField(initialValue: 999, inputWidth: 32, inputHeight: 42, onChanged: (_) {}),
            ),
          ),
        ),
      ),
    );
    expect(tester.getSize(find.byType(TextField)).width, greaterThanOrEqualTo(64));
    expect(tester.takeException(), isNull);
  });
}
