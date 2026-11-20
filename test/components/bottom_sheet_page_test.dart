import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mon_pacing/components/bottom_sheet/bottom_sheet_page.dart';

void main() {
  testWidgets('compact flow uses its intrinsic height', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  BottomSheetPage(
                    child: IntrinsicHeight(
                      child: Navigator(
                        pages: const [
                          MaterialPage(
                            child: SizedBox(height: 120),
                          ),
                        ],
                        onDidRemovePage: (_) {},
                      ),
                    ),
                  ).createRoute(context),
                );
              },
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();

    expect(tester.getSize(find.byType(BottomSheet)).height, lessThan(220));
  });
}
