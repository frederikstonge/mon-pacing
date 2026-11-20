import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/improvisation_metadata_chip/improvisation_metadata_chip.dart';
import 'package:mon_pacing/l10n/generated/app_localizations.dart';
import 'package:mon_pacing/models/constants.dart';
import 'package:mon_pacing/models/improvisation_model.dart';
import 'package:mon_pacing/models/improvisation_type.dart';
import 'package:mon_pacing/models/pacing_model.dart';
import 'package:mon_pacing/pages/pacing/widgets/improvisation_tile.dart';
import 'package:mon_pacing/pages/shell/shell_page_view.dart';

void main() {
  testWidgets('main navigation adapts to phone and tablet widths', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: ShellPageView(
          activeBranch: 0,
          branchContent: const SizedBox(),
          switchBranch: (_) {},
          showNavigation: true,
        ),
      ),
    );
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
    tester.view.physicalSize = const Size(800, 1280);
    await tester.pumpAndSettle();
    expect(find.byType(NavigationBar), findsNothing);
    expect(find.byType(NavigationRail), findsOneWidget);
  });

  testWidgets('pacing metadata chips retain the expandable editor', (tester) async {
    const improvisation = ImprovisationModel(
      id: 1,
      type: ImprovisationType.mixed,
      category: 'Comedy',
      theme: 'Theme',
      durationsInSeconds: [120],
      performers: '2',
      notes: '',
    );
    final pacing = PacingModel(
      id: 1,
      name: 'Pacing',
      createdDate: null,
      modifiedDate: null,
      improvisations: const [improvisation],
    );
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: ListView(
            children: [
              ImprovisationTile(
                pacing: pacing,
                improvisation: improvisation,
                improvisationFieldsOrder: Constants.defaultImprovisationFieldsOrder,
                index: 0,
                onChanged: (_) {},
                onDelete: (_) {},
                onConfirmDelete: (_) => false,
                dragEnabled: false,
                onDragStart: () {},
                getAllCategories: ({search = ''}) async => [],
              ),
            ],
          ),
        ),
      ),
    );
    expect(find.text('Category: Comedy'), findsOneWidget);
    expect(
      find.descendant(of: find.byType(ImprovisationMetadataChip), matching: find.text('Theme: Theme')),
      findsOneWidget,
    );
    await tester.tap(find.byType(ExpansionTile));
    await tester.pumpAndSettle();
    expect(find.byType(TextFormField), findsWidgets);
    expect(tester.takeException(), isNull);
  });
}
