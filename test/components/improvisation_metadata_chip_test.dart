import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/improvisation_metadata_chip/improvisation_metadata_chip.dart';
import 'package:mon_pacing/models/improvisation_fields.dart';
import 'package:mon_pacing/themes/themes.dart';

void main() {
  testWidgets('metadata chips have readable contrast in light and dark themes', (tester) async {
    for (final theme in [
      Themes.light(),
      Themes.dark(),
      Themes.lni(),
      Themes.ligmaLight(),
      Themes.ligmaDark(),
      Themes.boldor(),
      Themes.evenementCulturel(),
      Themes.paradoxe(),
    ]) {
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: Wrap(
              children: [
                for (final field in ImprovisationFields.values)
                  ImprovisationMetadataChip(field: field, label: 'Label', value: 'Value'),
              ],
            ),
          ),
        ),
      );
      for (final chip in tester.widgetList<Chip>(find.byType(Chip))) {
        final foreground = (chip.label as Text).style!.color!.computeLuminance();
        final background = chip.backgroundColor!.computeLuminance();
        final contrast =
            (foreground > background ? foreground + 0.05 : background + 0.05) /
            (foreground > background ? background + 0.05 : foreground + 0.05);
        expect(contrast, greaterThanOrEqualTo(4.5));
      }
    }
  });
}
